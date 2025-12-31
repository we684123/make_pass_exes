#!/bin/bash

# 檢查 output_pass_exes 資料夾是否存在，不存在則建立
if [ ! -d "output_pass_exes" ]; then
    mkdir output_pass_exes
fi

# 將 file_list.txt 中的檔案名讀入陣列 current_files
current_files=()
while IFS= read -r line; do
    current_files+=("$line.exe")
done < file_list.txt

# 刪除不在 file_list.txt 中的 exe 檔案
for exe_file in output_pass_exes/*.exe; do
    # 檢查是否有 exe 檔案存在
    [ -e "$exe_file" ] || continue
    
    file_name=$(basename "$exe_file")
    found=false
    
    for current_file in "${current_files[@]}"; do
        if [ "$file_name" = "$current_file" ]; then
            found=true
            break
        fi
    done
    
    if [ "$found" = false ]; then
        rm "$exe_file"
        echo "Deleted: $file_name"
    fi
done

# 生成 file_list.txt 中不存在的 exe 檔案
while IFS= read -r file_name; do
    if [ ! -f "output_pass_exes/${file_name}.exe" ]; then
        gcc -O3 -o "output_pass_exes/${file_name}.exe" empty_program.c
        echo "Generated: ${file_name}.exe"
    fi
done < file_list.txt
