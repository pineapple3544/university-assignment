#!/bin/bash

a=$1
b=$2

# 정수 계산
sum=$((a + b))
sub=$((a - b))
mul=$((a * b))

if [ "$b" -ne 0 ]; then
    div=$((a / b))
else
    div="0으로 나눌 수 없음"
fi

echo "a = $a"
echo "b = $b"
echo "a + b = $sum"
echo "a - b = $sub"
echo "a * b = $mul"
echo "a / b = $div"

