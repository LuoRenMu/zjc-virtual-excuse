
@echo off
:: 管理员权限检查
chcp 65001
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo 请右键选择"以管理员身份运行"此脚本
    pause
    exit
)

:: 1. 安装Python 3.9+
echo 正在检查Python安装...
python --version >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo 正在安装Python 3.9+...
    winget install Python.Python.3.9 --accept-package-agreements --accept-source-agreements
)

:: 2. 检查并安装mitmproxy
echo [步骤2/5] 正在检查mitmproxy安装...
where mitmdump >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo mitmproxy已安装
) else (
    echo 正在安装mitmproxy...
    pip install mitmproxy >nul 2>&1
    if %ERRORLEVEL% neq 0 (
        echo mitmproxy安装失败，请检查网络连接
        pause
        exit
    )
    echo mitmproxy安装成功
)
:: 3. 生成并安装证书
echo 正在生成mitmproxy证书...
start "" /wait mitmdump --quiet --certdump
echo 证书已生成，请手动安装以下证书：
echo %USERPROFILE%\.mitmproxy\mitmproxy-ca-cert.p12
echo 按任意键打开证书存储...
pause
certmgr.msc

:: 5. 设置系统代理
echo 正在设置系统代理...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "127.0.0.1:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "<local>" /f

:: 6. 启动mitmproxy
echo 正在启动mitmproxy...
echo 请在新打开的窗口中操作微信小程序...
start cmd /k "cd /d %~dp0 && mitmdump -s redirect.py"

:: 完成提示
echo 所有步骤已完成！
echo 请确保：已正确安装证书
pause