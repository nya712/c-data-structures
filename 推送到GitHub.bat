@echo off
chcp 65001 >nul
title 推送 c-data-structures 到 GitHub
cd /d D:\code\c-data-structures

echo ============================================
echo   推送 c-data-structures 到 GitHub
echo ============================================
echo.

echo [1/4] 检查本地提交...
git log --oneline
echo.

echo [2/4] 检查远程仓库是否已创建...
git ls-remote --exit-code origin >nul 2>&1
if errorlevel 1 (
  echo.
  echo   ❌ 远程仓库还不存在，或者还没登录。
  echo.
  echo   请先做这一步（二选一）：
  echo.
  echo   方法 A（推荐，最简单）：
  echo     1. 打开 GitHub Desktop
  echo     2. File ^-^> Add Local Repository
  echo     3. 选 D:\code\c-data-structures
  echo     4. 点右上角 "Publish repository"
  echo     5. 取消勾选 "Keep this code private"
  echo.
  echo   方法 B：
  echo     1. 浏览器打开 https://github.com/new
  echo     2. Repository name 填：c-data-structures
  echo     3. 不要勾选 Add a README / .gitignore / license
  echo     4. 点 Create repository
  echo     5. 回来重新双击本文件
  echo.
  pause
  exit /b 1
)

echo   ✅ 远程仓库存在
echo.

echo [3/4] 推送...
git push -u origin main
if errorlevel 1 (
  echo.
  echo   ⚠️ 推送失败。可能原因：
  echo     - 没登录 GitHub（打开 GitHub Desktop 登录一次）
  echo     - 仓库名不对
  echo.
  pause
  exit /b 1
)

echo.
echo [4/4] 完成！
echo.
echo   ✅ 你的仓库地址：
echo      https://github.com/nya712/c-data-structures
echo.
echo   以后的日常操作：
echo      写完代码后，双击 D:\code\c-data-structures\提交.bat
echo.
pause
