# encoding: utf-8
# language: ja
@javascript
機能: Load - プログラムのロード
  シナリオ: プログラムを読み込む
    前提 "エディタ" 画面を表示する

    もし "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば テキストエディタに "files/01.rb" を読み込むこと
    かつ "プログラム名の入力欄" は "01.rb" であること

  シナリオ: プログラムを入力済み状態でプログラムを読み込む
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである

    もし "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば テキストエディタに "files/01.rb" を読み込むこと
    かつ "プログラム名の入力欄" は "01.rb" であること

  シナリオ: 間違って画像を読み込もうとする
    前提 "エディタ" 画面を表示する

    もし "files/favicon.ico" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    ならば テキストエディタのプログラムは "" であること
    かつ "プログラム名の入力欄" は "" であること
    かつ "メッセージ" に "favicon.icoはRubyのプログラムではありません" を含むこと

  シナリオ: プログラムを修正後にロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである

    もし "ロードボタン" をクリックする

    ならば 確認メッセージ "まだセーブしていないのでロードするとプログラムが消えてしまうよ！それでもロードしますか？" を表示すること

  シナリオ: プログラムを修正後にセーブしてからロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ プログラムの名前に "01.rb" を指定する
    かつ "セーブボタン" をクリックする
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ ダウンロードが完了するまで待つ
    かつ 実際にはファイルをロードしないようにしておく

    もし "ロードボタン" をクリックする

    ならば 確認メッセージを表示しないこと

  シナリオ: プログラムを修正後にプログラムをロードしてからロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ "files/01.rb" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ
    かつ 実際にはファイルをロードしないようにしておく

    もし "ロードボタン" をクリックする

    ならば 確認メッセージを表示しないこと

  シナリオ: プログラムを修正後に間違って画像をロードしてからロードボタンを押す
    前提 "エディタ" 画面を表示する
    かつ テキストエディタに "puts 'Hello, World!'" を入力済みである
    かつ "files/favicon.ico" をロードする
    かつ JavaScriptによるリクエストが終わるまで待つ

    もし "ロードボタン" をクリックする

    ならば 確認メッセージ "まだセーブしていないのでロードするとプログラムが消えてしまうよ！それでもロードしますか？" を表示すること
