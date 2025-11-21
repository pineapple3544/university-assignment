#!/bin/bash


while true; do
	echo "==============="
	echo "1) 사용자 정보 확인"
	echo "2) GPU 또는 CPU 사용률 확인"
	echo "3) 메모리 사용량 확인"
	echo "4) 디스크 사용량 확인"
	echo "5) 종료"
	echo "==============="
	read -p "번호를 선택하세요: " menu

	case "$menu" in
		1)
			echo "[사용자 정보]"
			who
			echo
			;;
		2)
			echo "[GPU 또는 CPU 사용률]"

			if command -v nvidia-smi &>/dev/null; then
				nvidia-smi
			else
				echo "GPU 정보 없음 CPU 사용률을 표시합니다"
				top -b -n 1 | head -n 15
			fi
			
			echo
			;;

		3)
			echo "[메모리 사용량]"
			free -h
			echo
			;;
		4)
			echo "[디스크 사용량]"
			df -h
			echo
			;;
		5)
			echo "프로그램을 종료합니다"
			break
			;;
		*)
			echo "1~5 사이 정수만 입력하세요"
			;;
	esac
	echo
done
