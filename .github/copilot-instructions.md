# copilot-instructions.md

このプロジェクトはFlutter（fvm管理）で作成されたTODOアプリです。

## プロジェクト概要
- Flutter/DartでAndroid向けTODOアプリを開発
- fvmでFlutterバージョンを管理

## コーディング規約
- Dart公式の推奨スタイル（dart format/lint）を使用
- ファイル・ディレクトリ命名はlower_snake_case
- Widget名やクラス名はUpperCamelCase

## ディレクトリ構成
- `lib/` : アプリ本体
- `test/` : テストコード
- `android/`, `ios/`, `web/`, `macos/`, `linux/`, `windows/` : 各プラットフォーム用

## 開発・ビルド
- Flutterコマンドは `fvm flutter <command>` で実行
- 例: `fvm flutter run`, `fvm flutter pub get`

## タスク・PR管理
- すべての変更はプルリクエスト（PR）経由で行う
- PR作成時は、立てた計画（目的・主な変更点・レビューポイント等）をトップコメントに簡潔にまとめて添付する
- プッシュ前に、CI（flutter_ci.yml）で実行している以下の内容をローカルでも必ず確認する
    - 依存関係のインストール（flutter pub get）
    - フォーマットチェック（dart format --set-exit-if-changed .）
    - 静的解析（flutter analyze）
    - テスト実行（flutter test）
    - パッケージのアップデート確認（flutter pub outdated）
- IssueやPRは小さく分割し、こまめにレビュー
- mainブランチは常にビルド可能な状態を維持

## Copilot CLI活用例
- コード補完やリファクタ、テスト生成に活用
- 質問例: 「このWidgetのテストを書いて」「この関数をリファクタして」など

---

他に追加したいルールや情報があれば追記してください。
