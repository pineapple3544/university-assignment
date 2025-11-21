#!/bin/bash

read -p "점수를 입력하세요(예 : 95 91 90 0) : " -a scores

sum=0

for s in "${scores[@]}"; do
	if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
		echo "$s 점수는 0~100 사이여야 합니다."
		exit 1
	fi

	if [ "$s" -ge 90 ]; then
		grade="A"
	else
		grade="B"
	fi

	echo "$s , $grade"

	sum=$((sum + s))

done

count=${#scores[@]}
avg=$(echo "scale=2; $sum / $count" | bc -l)

echo "평균 점수: $avg"

if (( $(echo "$avg >= 90" | bc -l) )); then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 등급: $avg_grade"
