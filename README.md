# 오픈소스 기초설계

> 오픈소스 기초설계 프로젝트를 위해 smolvlm-500m 테스트

---

## 1. 가상환경 설정 (선택 사항)

가상환경을 사용하면 프로젝트별로 **패키지 충돌을 방지**할 수 있습니다.

```bash
python -m venv .venv
```

- **Windows**
  ```bash
  .venv\Scripts\activate
  ```
- **macOS / Linux**
  ```bash
  source .venv/bin/activate
  ```

---

## ⚙️ 2. 필수 패키지 설치

아래 명령으로 최신 버전의 핵심 패키지를 설치합니다.

```bash
pip install --upgrade torch transformers pillow
```

 **Tip:**  
이미지 관련 기능을 더 사용하고 싶다면 `pillow` 외에도 `opencv-python`을 추가로 설치할 수 있습니다.

---

## 3. 프로젝트 구조

아래와 같은 폴더 구조를 추천합니다.

```
your-repo/
├─ src/
│  └─ image3.png        # 테스트용 이미지 (사용자 준비)
├─ run_smolvlm.py       # 실행 스크립트
└─ README.md            # 현재 문서
```

---

## 4. 실행 예시

`run_smolvlm.py` 파일을 실행하면 SmolVLM 모델이 **이미지 설명 생성** 등을 수행합니다.

```bash
python run_smolvlm.py
```

---

## 참고 자료

- [SmolVLM-500M 모델 카드](https://huggingface.co/HuggingFaceTB/SmolVLM-500M-Instruct)  
- [PyTorch 공식 홈페이지](https://pytorch.org/)  
- [Transformers 문서](https://huggingface.co/docs/transformers/index)

---

**최종 수정일:** 2025-10-17  
**License:** [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)

> **Note:** 본 예제는 학습용이며, 실제 배포 시 모델 및 데이터 저작권 조건을 반드시 확인하세요.
