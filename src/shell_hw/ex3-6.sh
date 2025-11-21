#!/bin/bash


if [ $# -lt 2 ]; then
    echo "사용법: $0 arg1 arg2 [arg3 ...]"
    exit 1
fi

echo ">>> Python 실행파일 실행 중..."
python3 ex3-6.py "$@"
echo ">>> 실행 끝"

