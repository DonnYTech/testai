@echo off
chcp 65001 >nul
cd /d "%~dp0"

git add .
if errorlevel 1 (
    echo Git 未找到，请确保已安装并加入 PATH。
    pause
    exit /b 1
)

git commit -m "add delete"
git push

echo.
echo 完成
pause
