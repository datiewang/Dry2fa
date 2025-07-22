@echo off
chcp 65001 >nul
echo 2FA管理器 - 发布包构建
echo.

echo 1. 清理项目...
call flutter clean

echo 2. 获取依赖...
call flutter pub get

echo 3. 构建Windows发布版...
call flutter build windows --release --no-tree-shake-icons

echo 4. 检查构建结果...
if exist "build\windows\x64\runner\Release\flutter_2fa_manager.exe" (
    echo ✓ 构建成功！
    echo.
    
    echo 5. 创建发布包...
    if exist "release_package" rmdir /s /q "release_package"
    mkdir release_package
    
    REM 复制所有必需文件
    copy "build\windows\x64\runner\Release\flutter_2fa_manager.exe" "release_package\"
    copy "build\windows\x64\runner\Release\flutter_windows.dll" "release_package\"
    xcopy "build\windows\x64\runner\Release\data" "release_package\data\" /E /H /C /I /Y
    
    echo.
    echo 6. 创建使用说明...
    echo.
    
    echo ✓ 发布包准备完成！
    echo.
    echo 📁 发布文件夹: release_package\
    echo   ├── flutter_2fa_manager.exe    (主程序)
    echo   ├── flutter_windows.dll        (Flutter运行库)
    echo   └── data\                      (应用数据)
    echo.
    echo ⚠️  发布注意事项:
    echo   - 请发布整个release_package文件夹
    echo   - exe文件不能单独运行
    echo   - Windows Defender可能会报警
    echo   - 首次运行时选择"更多信息"→"仍要运行"
    echo.
    
) else (
    echo ✗ 构建失败
    echo 请检查构建日志
)

pause