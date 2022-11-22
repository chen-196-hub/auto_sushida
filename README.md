# auto_sushida

寿司打を自動化にしました。

# 起動

### おすすめプラン
```
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


⚠️ 2022/11/22現在、お手頃プランについては、画像認証うまくできないときがあるため、非推奨になっています。


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

もし不明点がありました、issueにてご連絡いただければ幸いです。