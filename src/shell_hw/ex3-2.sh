#!/bin/bash


read -p "실수 2개를 입력하세요 : " x1 x2

echo "1번 결과 : "
echo "scale=3; 0.5 * $x1 * $x1" | bc -l

echo "2번 결과 : "
echo "scale=3; 0.5 * $x2 * $x2" | bc -l

