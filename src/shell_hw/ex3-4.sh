#!/bin/bash

# 점수 저장할 배열
scores=()

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    
    read -p "번호 선택: " menu

    case "$menu" in

        1)  # 과목 성적 추가
            read -p "추가할 점수 입력 (0~100): " s
            if [ "$s" -lt 0 ] || [ "$s" -gt 100 ]; then
                echo "점수는 0~100 사이여야 합니다."
            else
                scores+=("$s")
                echo "점수 $s 저장 완료!"
            fi
            ;;

        2)  # 입력된 모든 점수 보기
            if [ ${#scores[@]} -eq 0 ]; then
                echo "아직 입력된 점수가 없습니다."
            else
                echo "현재 저장된 점수들:"
                printf "%s\n" "${scores[@]}"
            fi
            ;;

        3)  # 평균 점수 확인
            if [ ${#scores[@]} -eq 0 ]; then
                echo "평균을 계산할 점수가 없습니다."
            else
                sum=0
                for v in "${scores[@]}"; do
                    sum=$((sum + v))
                done
                avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc -l)
                echo "평균 점수: $avg"
            fi
            ;;

        4)  # 평균 등급(GPA) 변환
            if [ ${#scores[@]} -eq 0 ]; then
                echo "GPA를 계산할 점수가 없습니다."
            else
                sum=0
                for v in "${scores[@]}"; do
                    sum=$((sum + v))
                done
                avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc -l)

                # GPA 변환 기준 (예시 기준)
                # 90~100 → 4.0
                # 80~89  → 3.0
                # 70~79  → 2.0
                # 60~69  → 1.0
                # 0~59   → 0.0
                if (( $(echo "$avg >= 90" | bc -l) )); then
                    gpa=4.0
                elif (( $(echo "$avg >= 80" | bc -l) )); then
                    gpa=3.0
                elif (( $(echo "$avg >= 70" | bc -l) )); then
                    gpa=2.0
                elif (( $(echo "$avg >= 60" | bc -l) )); then
                    gpa=1.0
                else
                    gpa=0.0
                fi

                echo "평균 점수: $avg"
                echo "GPA 변환 결과: $gpa"
            fi
            ;;

        5)  # 종료
            echo "프로그램을 종료합니다."
            break
            ;;

        *)  # 잘못된 입력
            echo "1~5 사이 번호를 입력하세요."
            ;;
    esac

    echo
done

