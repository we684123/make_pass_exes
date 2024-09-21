@echo off
setlocal enabledelayedexpansion

REM 檢查 output_pass_exes 資料夾是否存在，不存在則建立
if not exist output_pass_exes (
    mkdir output_pass_exes
)

REM 將 file_list.txt 中的檔案名讀入集合 current_files
set "current_files="
for /f %%f in (file_list.txt) do (
    set "current_files=!current_files! %%f.exe"
)

REM 刪除不在 file_list.txt 中的 exe 檔案
for %%f in (output_pass_exes\*.exe) do (
    set "file_name=%%~nxf"
    echo !current_files! | findstr /i /c:"!file_name!" >nul
    if errorlevel 1 (
        del "%%f"
        echo Deleted: %%~nxf
    )
)

REM 生成 file_list.txt 中不存在的 exe 檔案
for /f %%f in (file_list.txt) do (
    if not exist output_pass_exes\%%f.exe (
        gcc -O3 -o output_pass_exes\%%f.exe empty_program.c
        echo Generated: %%f.exe
    )
)
