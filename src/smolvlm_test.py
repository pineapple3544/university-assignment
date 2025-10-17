import torch
from PIL import Image
from transformers import AutoProcessor, AutoModelForVision2Seq
from pathlib import Path

DEVICE = "cuda" if torch.cuda.is_available() else "cpu"
MODEL_ID = "HuggingFaceTB/SmolVLM-500M-Instruct"  # 로컬 경로로 바꿔도 됩니다.

# 1) 프로세서/모델 로드
processor = AutoProcessor.from_pretrained(MODEL_ID)
model = AutoModelForVision2Seq.from_pretrained(
    MODEL_ID,
    torch_dtype=torch.bfloat16 if DEVICE == "cuda" else torch.float32,
    _attn_implementation="flash_attention_2" if DEVICE == "cuda" else "eager",
).to(DEVICE)

# 2) 대화 프롬프트(챗 템플릿) + 이미지 준비
image = Image.open(".\\src\\image3.png").convert("RGB")
messages = [
    {
        "role": "user",
        "content": [
            {"type": "image"},
            {"type": "text", "text": "read only the completed text in image "},
        ],
    }
]

# 3) 토크나이즈 / 텐서화
prompt = processor.apply_chat_template(messages, add_generation_prompt=True)
inputs = processor(text=prompt, images=[image], return_tensors="pt").to(DEVICE)

# 4) 생성
with torch.no_grad():
    output_ids = model.generate(**inputs, max_new_tokens=200)
text = processor.batch_decode(output_ids, skip_special_tokens=True)[0]
print(text)

