@echo off
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
    copy "build\windows\x64\runner\Release\flutter_2fa_manager.exe" "release_package\"
    copy "build\windows\x64\runner\Release\flutter_windows.dll" "release_package\"
    xcopy "build\windows\x64\runner\Release\data" "release_package\data\" /E /H /C /I /Y
    
    echo.
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
)

pause