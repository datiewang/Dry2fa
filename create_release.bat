@echo off
<<<<<<< HEAD
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
=======
echo 2FA认証マネージャー - リリースパッケージ作成
echo.

echo 1. プロジェクトクリーンアップ...
call flutter clean

echo 2. 依存関係の取得...
call flutter pub get

echo 3. Windowsリリースビルド...
call flutter build windows --release --no-tree-shake-icons

echo 4. ビルド完了チェック...
if exist "build\windows\x64\runner\Release\flutter_2fa_manager.exe" (
    echo ✓ ビルド成功！
    echo.
    
    echo 5. 配布用パッケージを作成中...
    if exist "release_package" rmdir /s /q "release_package"
    mkdir release_package
    
    REM 必要なファイルをすべてコピー
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
    copy "build\windows\x64\runner\Release\flutter_2fa_manager.exe" "release_package\"
    copy "build\windows\x64\runner\Release\flutter_windows.dll" "release_package\"
    xcopy "build\windows\x64\runner\Release\data" "release_package\data\" /E /H /C /I /Y
    
    echo.
<<<<<<< HEAD
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
=======
    echo 6. 使用説明書を作成...
    echo.
    
    echo ✓ 配布用パッケージの準備完了！
    echo.
    echo 📁 配布用フォルダ: release_package\
    echo   ├── flutter_2fa_manager.exe    (メインプログラム)
    echo   ├── flutter_windows.dll        (Flutter実行時ライブラリ)
    echo   └── data\                      (アプリケーションデータ)
    echo.
    echo ⚠️  配布時の注意事項:
    echo   - release_packageフォルダ全体を配布してください
    echo   - exe単体では動作しません
    echo   - Windows Defenderで警告が出る場合があります
    echo   - 初回実行時は「詳細情報」→「実行」を選択してください
    echo.
    
) else (
    echo ✗ ビルドに失敗しました
    echo ログを確認してください
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
)

pause