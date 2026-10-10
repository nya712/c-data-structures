@echo off
chcp 65001 >nul
title 提交并推送
cd /d D:\code\c-data-structures

echo ============================================
echo   提交并推送（每次写完代码双击这个）
echo ============================================
echo.

git add -A
if errorlevel 1 goto fail

git status --short
echo.

set /p MSG=请输入这次做了什么（直接回车用默认）：
if "%MSG%"=="" set MSG=update: 继续学习

git commit -m "%MSG%"
if errorlevel 1 (
  echo.
  echo   没有新改动，或者提交失败。
  echo.
  pause
  exit /b 0
)

git push
if errorlevel 1 goto fail

echo.
echo   ✅ 已推送！去这里看：https://github.com/nya712/c-data-structures
echo.
pause
exit /b 0

:fail
echo.
echo   ⚠️ 出错了。如果提示没登录，打开 GitHub Desktop 登录一次。
echo.
pause
exit /b 1
