@echo off
echo 2FA認証マネージャー - リリースビルド開始
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
    echo 実行ファイルの場所:
    echo build\windows\x64\runner\Release\flutter_2fa_manager.exe
    echo.
    echo 配布用フォルダを作成中...
    if not exist "release" mkdir release
    xcopy "build\windows\x64\runner\Release\*" "release\" /E /H /C /I /Y
    echo.
    echo ✓ 配布用ファイルがreleaseフォルダにコピーされました
    echo ✓ 2FA認証マネージャーの準備完了！
) else (
    echo ✗ ビルドに失敗しました
    echo ログを確認してください
)

pause