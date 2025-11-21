#!/bin/bash
# ex3-5.sh
# 사용 예시:
#   ./ex3-5.sh "-al"
#   ./ex3-5.sh "-lh /etc"


run_ls() {

    local opts="$*"



    eval "ls $opts"
}


if [ $# -eq 0 ]; then
    echo "사용법: $0 \"ls 옵션들\""
    echo "예: $0 \"-al\"   또는  $0 \"-lh /etc\""
    exit 1
fi


run_ls "$@"

