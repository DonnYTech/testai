@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo 正在初始化 Git 仓库...
git init
if errorlevel 1 (
    echo.
    echo 错误：Git 未安装或不在 PATH 中
    echo 请先安装 Git for Windows: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo.
echo 正在添加所有文件...
git add .

echo.
echo 正在提交...
git commit -m "first commit"

echo.
echo 正在设置 main 分支...
git branch -M main

echo.
echo 正在添加远程仓库...
git remote remove origin 2>nul
git remote add origin https://github.com/DonnYTech/testai.git

echo.
echo 正在推送到 GitHub...
git push -u origin main

echo.
echo 完成！
pause
