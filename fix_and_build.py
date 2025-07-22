#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
2FA認証マネージャー - ビルド修正スクリプト
Windows向けFlutterアプリケーションのビルドを修正します。
"""
import os
import subprocess
import sys
import shutil

def run_command(cmd, cwd=None):
    """コマンドを実行し、結果を返す"""
    try:
        result = subprocess.run(
            cmd, 
            shell=True, 
            capture_output=True, 
            text=True, 
            cwd=cwd,
            encoding='utf-8'
        )
        return result.returncode == 0, result.stdout, result.stderr
    except Exception as e:
        return False, "", str(e)

def main():
    print("🔧 2FA認証マネージャー - ビルド修正開始")
    print("=" * 50)
    
    # プロジェクトディレクトリの確認
    if not os.path.exists("lib"):
        print("❌ Flutterプロジェクトが見つかりません")
        return False
    
    # 1. キャッシュクリア
    print("\n1️⃣ キャッシュのクリア...")
    success, out, err = run_command("flutter clean")
    if success:
        print("✅ キャッシュクリア完了")
    else:
        print(f"⚠️ キャッシュクリアに問題: {err}")
    
    # buildディレクトリを完全削除
    if os.path.exists("build"):
        try:
            shutil.rmtree("build")
            print("✅ buildディレクトリ削除完了")
        except:
            print("⚠️ buildディレクトリ削除に問題")
    
    # 2. 依存関係の再取得
    print("\n2️⃣ 依存関係の取得...")
    success, out, err = run_command("flutter pub get")
    if success:
        print("✅ 依存関係取得完了")
    else:
        print(f"❌ 依存関係取得失敗: {err}")
        return False
    
    # 3. Windowsプラットフォーム有効化
    print("\n3️⃣ Windowsプラットフォーム有効化...")
    run_command("flutter config --enable-windows-desktop")
    print("✅ Windowsプラットフォーム有効化完了")
    
    # 4. 代替構築方法
    print("\n4️⃣ 代替構築を試行...")
    
    # MSBuildの直接使用を試行
    success, out, err = run_command("flutter build windows --release --no-tree-shake-icons")
    
    if success:
        print("✅ ビルド成功！")
        
        # 実行ファイルの確認
        exe_path = "build/windows/x64/runner/Release/flutter_2fa_manager.exe"
        if os.path.exists(exe_path):
            print(f"🎉 実行ファイルが作成されました: {exe_path}")
            
            # releaseフォルダの作成
            release_dir = "release"
            if os.path.exists(release_dir):
                shutil.rmtree(release_dir)
            
            # 必要なファイルをコピー
            shutil.copytree("build/windows/x64/runner/Release", release_dir)
            
            print(f"📦 配布用ファイルが {release_dir}/ フォルダに準備されました")
            print("\n🚀 使用方法:")
            print(f"   {release_dir}/flutter_2fa_manager.exe を実行してください")
            
            return True
        else:
            print("❌ 実行ファイルが見つかりません")
    else:
        print(f"❌ ビルド失敗: {err}")
        
        # Flutter Webバージョンを作成
        print("\n🌐 代替案: Flutter Webバージョンを作成...")
        web_success, web_out, web_err = run_command("flutter build web")
        
        if web_success:
            print("✅ Flutter Webバージョンが作成されました: build/web/")
            print("   ローカルサーバーで実行するか、PWAとして使用できます")
        
    return False

if __name__ == "__main__":
    try:
        success = main()
        if not success:
            print("\n⚠️ ビルドに問題がありました")
            print("💡 HTML版を使用することをお勧めします: 2FA認証マネージャー_簡易版.html")
        input("\nEnterキーを押して終了...")
    except KeyboardInterrupt:
        print("\n\n🛑 ユーザーによって中断されました")
    except Exception as e:
        print(f"\n❌ 予期しないエラー: {e}")
        input("\nEnterキーを押して終了...")