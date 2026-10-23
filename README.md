# 構成管理

## 新しいMacでのセットアップ
ターミナルで以下を実行
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tHyt-lab/dotfiles/main/bootstrap.sh)"`

Homebrew・リポジトリのclone・各設定(`setup.sh`)まで自動で実行されます。
手動でcloneした場合は `cd dotfiles && ./setup.sh` (または `make`)。個別に実行する場合は `make link` / `make brew` など(`Makefile`参照)。

再実行しても安全です。リンク済みのファイルはスキップし、既存のファイルは `~/.dotfiles_backup/<日時>/` に退避してからリンクします。

## 差分の確認
`make doctor` で、リンク・Brewfile・mise・Claude Codeと実機とのずれを表示します(読み取りのみ)。

## 手動で行う作業
- App Storeへのサインインとアプリのインストール (masは未導入。GitHub Actionsでこけてしまうため)
- GPG秘密鍵のインポートと `.gitconfig` の `signingkey` の確認 (コミット署名)
- `gh auth login`
- `claude` の初回ログイン
- システム設定での権限許可 (Maccyなどのアクセシビリティ)
- 既存アプリをHomebrew管理に取り込む場合: `brew install --cask --adopt <名前>` (ターミナルに「App管理」権限が必要)
- 再起動

## ディレクトリ構造
```
dotfiles/
├── bootstrap.sh      # 新しいMac用の入口
├── setup.sh          # メインセットアップスクリプト
├── Makefile          # 個別実行用
├── .config/          # XDG config (gh/config.yml, git, mise)
├── .gitconfig        # Git設定
├── zsh/              # Zsh関連
│   ├── .zshrc        # Zsh設定
│   ├── .p10k.zsh     # Powerlevel10k設定
│   └── setup.sh      # Oh My Zshセットアップ
├── homebrew/         # Homebrew関連
│   ├── Brewfile      # パッケージ定義
│   └── setup.sh      # Homebrewセットアップ
└── scripts/          # セットアップスクリプト
    ├── links.conf    # リンク一覧 (link.sh / doctor.sh が参照)
    ├── init.sh       # 初期設定
    ├── link.sh       # シンボリックリンク作成
    ├── mise.sh       # miseと管理ツールのインストール
    ├── defaults.sh   # macOS設定
    ├── font-install.sh # フォントインストール
    ├── claude-code.sh  # Claude Codeインストール
    └── doctor.sh     # 差分確認
```
