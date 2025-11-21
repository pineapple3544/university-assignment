#!/bin/bash


if [ ! -d "DB" ]; then
	echo "DB 디렉토리가 없습니다. 생성합니다"
	mkdir DB
else
	echo "DB 디렉토리가 이미 존재합니다"
fi

cd DB || exit 1

echo "5개 파일을 생성합니다"

for i in 1 2 3 4 5; do
	filename="file${i}.txt"
	echo "This is ${filename}" > "${filename}"
done

echo "파일들을 압축합니다"
tar -czf db_files.tar.gz file1.txt file2.txt file3.txt file4.txt file5.txt

cd ..

if [ ! -d "train" ]; then
	echo "train 디렉토리를 생성했습니다"
	mkdir train
else
	echo "train 디렉토리가 이미 존재합니다"
fi

echo "train 디렉토리에 DB 내부 파일들의 링크를 생성합니다..."
for i in 1 2 3 4 5; do
    src_path="DB/file${i}.txt"
    link_path="train/file${i}.txt"

    # 이미 링크(파일)가 있으면 삭제 후 다시 생성
    if [ -e "${link_path}" ]; then
        rm -f "${link_path}"
    fi

    ln -s "../${src_path}" "${link_path}"
done

echo "ex3-8 작업이 완료되었습니다."
