# 構成管理

## スクリプトの実行
当リポジトリをClone
`git clone https://github.com/tHyt-lab/dotfiles.git`

クローンできればフォルダに移動してスクリプトを実行
`cd dotfiles`
`./setup.sh` or `make`

## ディレクトリ構造
```
dotfiles/
├── .config/          # XDG config (gh, git, mise, starship)
├── .gitconfig        # Git設定
├── zsh/              # Zsh関連
│   ├── .zshrc        # Zsh設定
│   ├── .p10k.zsh     # Powerlevel10k設定
│   └── setup.sh      # Oh My Zshセットアップ
├── homebrew/         # Homebrew関連
│   ├── Brewfile      # パッケージ定義
│   └── setup.sh      # Homebrewセットアップ
├── scripts/          # セットアップスクリプト
│   ├── init.sh       # 初期設定
│   ├── link.sh       # シンボリックリンク作成
│   ├── defaults.sh   # macOS設定
│   └── font-install.sh # フォントインストール
└── setup.sh          # メインセットアップスクリプト
```

## 注意点
AppStoreからインストールするものは手動になります。(GitHubActionsでこけてしまうため)
Brewfileにmasを追加して再度バンドルするのもあり。