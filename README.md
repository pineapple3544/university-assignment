#오픈소스기초설계

# (선택) 가상환경
python -m venv .venv 
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate

# 필수 패키지
pip install --upgrade torch transformers pillow

# (선택) huggingface_hub: 코드에서 모델/가중치 다운로드 자동화를 쓰고 싶을 때
pip install --upgrade huggingface_hub

your-repo/
├─ src/
│  └─ image3.png        # 테스트 이미지 (사용자 준비)
├─ run_smolvlm.py       # 아래 예제 스크립트 저장
└─ README.md

