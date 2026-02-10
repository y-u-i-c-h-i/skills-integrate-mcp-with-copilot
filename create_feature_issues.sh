#!/bin/bash
# Script to create GitHub issues for new features
# This script creates 9 issues based on the Evolvve-Student-Chapter-App inspiration

set -e  # Exit on any error

REPO="y-u-i-c-h-i/skills-integrate-mcp-with-copilot"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "Error: Not authenticated with GitHub CLI."
    echo "Please run: gh auth login"
    exit 1
fi

echo "Creating GitHub issues for new features..."

# Issue 1: 管理者モード
gh issue create \
  --title "管理者モード - 先生や管理者専用の操作権限の実装" \
  --body "## 概要
現在のシステムには、管理者と一般生徒を区別する仕組みがありません。先生や管理者が特定の操作を実行できるように、管理者モードを実装する必要があります。

## 機能要件
- [ ] 管理者と一般ユーザーの役割分離
- [ ] 管理者専用のログイン機能
- [ ] 管理者のみが実行できる操作:
  - [ ] 活動の追加・編集・削除
  - [ ] 参加者の管理（強制登録・削除）
  - [ ] システム設定の変更
- [ ] 管理者ダッシュボードの実装

## 技術的考慮事項
- 認証・認可システムの実装
- ロールベースアクセス制御（RBAC）
- セキュアなセッション管理

## ラベル
enhancement, security" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 2: ユーザー登録・認証
gh issue create \
  --title "ユーザー登録・認証システムの実装" \
  --body "## 概要
現在、システムはメールアドレスのみで生徒を識別していますが、適切なユーザー認証システムが必要です。

## 機能要件
- [ ] ユーザー登録機能
  - [ ] 学生証番号
  - [ ] 氏名
  - [ ] メールアドレス
  - [ ] パスワード
- [ ] ログイン・ログアウト機能
- [ ] パスワードリセット機能
- [ ] プロフィール管理機能
- [ ] セッション管理

## 技術的考慮事項
- パスワードのハッシュ化（bcrypt等）
- JWT トークンまたはセッションベース認証
- メール検証システム
- セキュリティベストプラクティスの適用

## ラベル
enhancement, security" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 3: 委員会や役職の管理
gh issue create \
  --title "委員会・役職管理システムの実装" \
  --body "## 概要
生徒会や各種委員会の役職を管理できる機能を追加します。

## 機能要件
- [ ] 委員会の作成・編集・削除
- [ ] 役職の定義（会長、副会長、書記、会計など）
- [ ] 生徒への役職割り当て
- [ ] 役職に基づく権限管理
- [ ] 委員会メンバー一覧表示
- [ ] 役職履歴の記録

## 技術的考慮事項
- 委員会と活動の関連付け
- 階層的な役職構造のサポート
- 役職変更履歴の管理

## ラベル
enhancement" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 4: イベント詳細管理
gh issue create \
  --title "イベント詳細管理機能の拡張" \
  --body "## 概要
現在の活動情報に加えて、より詳細なイベント情報を管理できるようにします。

## 機能要件
- [ ] イベント追加情報:
  - [ ] 賞金・賞品情報
  - [ ] 審査員情報
  - [ ] イベント会場
  - [ ] 参加費用
  - [ ] 必要な持ち物
  - [ ] 服装規定
  - [ ] 締切日
- [ ] イベントステータス管理（募集中、開催中、終了）
- [ ] イベントカテゴリー分類
- [ ] 添付ファイル機能（ポスター、規約書など）

## 技術的考慮事項
- データモデルの拡張
- ファイルアップロード機能
- カレンダー統合

## ラベル
enhancement" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 5: グループ参加登録
gh issue create \
  --title "グループ参加登録機能の実装" \
  --body "## 概要
チーム制の活動やイベントに対応するため、グループでの参加登録機能を追加します。

## 機能要件
- [ ] グループ作成機能
- [ ] グループ名の設定
- [ ] グループメンバーの追加・削除
- [ ] グループリーダーの指定
- [ ] グループ単位での活動参加
- [ ] グループ参加状況の表示
- [ ] グループ内コミュニケーション機能

## 技術的考慮事項
- グループと個人の両方の参加形式のサポート
- グループ定員管理
- グループ招待システム

## ラベル
enhancement" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 6: ニュース・トレンド機能
gh issue create \
  --title "ニュース・トレンド機能の実装" \
  --body "## 概要
学校内の最新情報やトレンドを共有できる機能を追加します。

## 機能要件
- [ ] ニュース投稿機能（管理者のみ）
- [ ] ニュースカテゴリー（お知らせ、イベント情報、成果報告など）
- [ ] ニュース一覧表示
- [ ] ニュース詳細ページ
- [ ] トレンド活動の表示（人気の活動ランキング）
- [ ] 新着情報の通知
- [ ] コメント機能

## 技術的考慮事項
- リッチテキストエディタの統合
- 画像アップロード機能
- タグ・カテゴリー管理
- 通知システム

## ラベル
enhancement" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 7: フィードバック機能
gh issue create \
  --title "フィードバック・評価システムの実装" \
  --body "## 概要
参加した活動に対するフィードバックや評価を収集する機能を追加します。

## 機能要件
- [ ] 活動参加後のフィードバック送信
- [ ] 星評価システム（1-5段階）
- [ ] コメント・感想の記入
- [ ] 改善提案の投稿
- [ ] フィードバック集計・分析
- [ ] 管理者によるフィードバックの確認
- [ ] 匿名フィードバックのオプション

## 技術的考慮事項
- フィードバックの集計・可視化
- データ分析機能
- レポート生成

## ラベル
enhancement" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 8: 会費管理
gh issue create \
  --title "会費管理システムの実装" \
  --body "## 概要
活動やイベントに関連する会費の管理機能を追加します。

## 機能要件
- [ ] 会費設定機能（活動ごと）
- [ ] 支払い状況の記録
- [ ] 支払い期限の設定
- [ ] 支払いステータス表示（未払い、支払い済み）
- [ ] 支払いリマインダー通知
- [ ] 会費履歴の管理
- [ ] 領収書発行機能
- [ ] 財務レポート生成

## 技術的考慮事項
- 支払い情報の安全な管理
- 将来的な決済システム統合の準備
- 会計監査用のログ記録

## ラベル
enhancement" \
  --label "enhancement" \
  --repo "$REPO"

# Issue 9: データベースによる永続化
gh issue create \
  --title "データベース統合による永続化の実装" \
  --body "## 概要
現在、データはメモリ内に保存されているため、アプリケーションを再起動するとデータが失われます。データベースを統合してデータの永続化を実現します。

## 機能要件
- [ ] データベースの選定と統合（SQLite/PostgreSQL/MySQL）
- [ ] すべてのデータモデルのデータベース移行
- [ ] データベーススキーマの設計
- [ ] マイグレーションシステムの実装
- [ ] バックアップ・復元機能
- [ ] データベース接続プーリング

## 技術的考慮事項
- ORM の選定（SQLAlchemy、Tortoise ORM など）
- データベース設計（正規化、インデックス）
- トランザクション管理
- データベースバックアップ戦略
- パフォーマンス最適化

## 優先度
このissueは他の多くの機能の基盤となるため、最初に実装することを推奨します。

## ラベル
enhancement, priority" \
  --label "enhancement" \
  --repo "$REPO"

echo "All issues created successfully!"
