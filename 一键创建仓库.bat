@echo off
chcp 65001 >nul
title 一键创建 GitHub 仓库并推送
cd /d D:\code\c-data-structures

echo ============================================================
echo   一键创建 GitHub 仓库并推送
echo ============================================================
echo.
echo   仓库名 : c-data-structures
echo   账号   : nya712
echo   本地   : D:\code\c-data-structures
echo.
echo   运行后会弹出浏览器让你登录 GitHub 授权（只需一次）。
echo   授权完成后，仓库会自动创建并把代码推上去。
echo.
pause

echo.
echo [1/3] 检查 GitHub CLI 是否安装...
where gh >nul 2>&1
if errorlevel 1 (
  echo.
  echo   ⚠️ 没有找到 gh（GitHub 官方命令行工具）
  echo.
  echo   需要先装一下，两种方法任选：
  echo.
  echo   方法 A（命令行，最快）：
  echo     1. 按 Win + X，选 "Windows PowerShell（管理员）"
  echo     2. 粘贴这行并回车：
  echo        winget install --id GitHub.cli
  echo     3. 装完关掉窗口，重新双击本文件
  echo.
  echo   方法 B（手动下载）：
  echo     打开 https://cli.github.com/ 下载 Windows 版安装
  echo.
  pause
  exit /b 1
)

echo   ✅ gh 已安装
echo.

echo [2/3] 检查登录状态...
gh auth status >nul 2>&1
if errorlevel 1 (
  echo   未登录，现在开始登录（会弹出浏览器）...
  echo.
  gh auth login --hostname github.com --git-protocol https --web
  if errorlevel 1 (
    echo.
    echo   ⚠️ 登录失败或被取消。
    echo.
    pause
    exit /b 1
  )
)
echo   ✅ 已登录
echo.

echo [3/3] 创建仓库并推送...
gh repo create c-data-structures --public --source=. --remote=origin --push
if errorlevel 1 (
  echo.
  echo   ⚠️ 失败。可能仓库已存在，试试直接推送：
  echo.
  git push -u origin main
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================================
echo   ✅ 完成！
echo.
echo   你的仓库地址：
echo      https://github.com/nya712/c-data-structures
echo.
echo   以后每次写完代码，双击 D:\code\c-data-structures\提交.bat 就行。
echo ============================================================
echo.
pause
