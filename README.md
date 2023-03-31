# dotfiles

## 要件

- GNU Make、NVIM 0.7 以降が必要

## インストール

- `git clone` などで環境にリポジトリを持ってくる。
- インストールは `make install` のみで完結する。
- アンインストールする手段はないので注意……。

## 仕様

- [XDG Base Directory](https://wiki.archlinux.jp/index.php/XDG_Base_Directory) を用いる。
  - 原則 `.config/` ディレクトリ配下に設定ファイルを置く。
  - Bash は XDGBD に対応しないようなので例外とする。
- `vim` は最小限の設定しかしていないが、`nvim` は色々設定している。
