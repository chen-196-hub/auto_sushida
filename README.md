# auto_sushida

tesseractやseleniumの研究のため、寿司打を自動化にしました。

![auto_sushida](https://user-images.githubusercontent.com/78460152/203343949-b9909116-3207-4b44-b53a-339423e106c0.gif)


# 起動

### おすすめプラン　（多分一番安定）
```ruby
ruby auto_shshida.rb
```
または
```ruby
ruby auto_shshida.rb n  #or ruby auto_shshida.rb normal
```

### 高級プラン
```ruby
ruby auto_shshida.rb h  #or ruby auto_shshida.rb hard
```

### お手軽プラン
```ruby
ruby auto_shshida.rb e  #or ruby auto_shshida.rb easy
```
⚠️ 2022/11/22現在、お手軽プランについては、画像認証うまくできないときがあるため、非推奨になっています。


# 使用技術
- ruby 2.7.2
- tesseract 光学画像認証
- gem
  - selenium-webdriver
  - mini_magick

# 環境構築
seleniumについて、chromeなどのブラウザはdriverが必要

```
brew install tesseract
```

```
bundle install
```

もし不明点がありましたら、issueにてご連絡いただければ幸いです。

## 免責事項

当システムは研究の目的に作ったもので、
ご利用、もしくはご利用になれないことにより生じるいかなるトラブルや損害には、当方は一切の責任を負いません。
