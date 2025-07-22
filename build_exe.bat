@echo off
chcp 65001 >nul
echo 2FA Authentication Manager - Windows EXE Build
echo ================================================

echo Step 1: Clean previous build...
flutter clean
if exist "build" rmdir /s /q build

echo Step 2: Get dependencies...
flutter pub get

echo Step 3: Enable Windows desktop...
flutter config --enable-windows-desktop

echo Step 4: Try building Windows release...
flutter build windows --release --no-tree-shake-icons

echo Step 5: Check build result...
if exist "build\windows\x64\runner\Release\flutter_2fa_manager.exe" (
    echo SUCCESS: EXE file created!
    echo.
    echo Creating distribution package...
    if exist "2FA_Manager_Windows" rmdir /s /q 2FA_Manager_Windows
    mkdir 2FA_Manager_Windows
    xcopy "build\windows\x64\runner\Release\*" "2FA_Manager_Windows\" /E /H /C /I /Y
    
    echo.
    echo ====================================================
    echo BUILD COMPLETED SUCCESSFULLY!
    echo ====================================================
    echo Executable: 2FA_Manager_Windows\flutter_2fa_manager.exe
    echo You can distribute the entire "2FA_Manager_Windows" folder
    echo.
) else (
    echo.
    echo BUILD FAILED - trying alternative web version...
    flutter build web
    if exist "build\web\index.html" (
        echo Web version created successfully: build\web\
        echo You can serve this as a web app or use the HTML version instead
    )
    echo.
    echo Alternative: Use the HTML version: 2FA_Manager_Simple.html
)

echo.
echo Press any key to continue...
pause >nul