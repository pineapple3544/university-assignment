#!/bin/bash 

DB_FILE="DB.txt"

if [ ! -f "$DB_FILE" ]; then
	touch "$DB_FILE"
fi

add_member() {
	echo "==팀원 정보 추가=="
	read -p "이름 : " name
	read -p "생일 또는 전화번호 : " info

	echo "member|$name|$info" >> "$DB_FILE"
	echo "팀원 정보가 저장되었습니다"
}

add_record() {
	echo "==팀원과 한 일 기록=="
	read -p "날짜(예: 2025-11-21): " date
	read -p "함께한 팀원 이름 : " name
	read -p "한 일 기록 : " work

	echo "log|$date|$name|$work" >> "$DB_FILE"
	echo "기록이 저장되었습니다"
}

search_member() {
	echo "==팀원 검색=="
	read -p "검색할 이름: " name

	echo "==검색 결과=="
	grep "^member|$name|" "$DB_FILE" 2>/dev/null || echo "정보가 없습니다"
}

search_work() {
    echo "==수행 내용 검색=="
    read -p "검색할 이름 또는 날짜 : " keyword

    echo "==검색 결과=="

    # -a 옵션: 어떤 파일이든 텍스트 취급하게 만듦
    result=$(grep -a "^log|" "$DB_FILE" | grep -a "$keyword")

    if [ -n "$result" ]; then
        echo "$result"
    else
        echo "해당 키워드에 대한 기록이 없습니다."
    fi
}

while true; do
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="
    read -p "메뉴를 선택하세요(1-5): " choice

    case "$choice" in
        1)
            add_member
            ;;
        2)
            add_record
            ;;
        3)
            search_member
            ;;
        4)
            search_work
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "잘못된 입력입니다. 1~5 중에서 선택하세요."
            ;;
    esac
    echo
done
