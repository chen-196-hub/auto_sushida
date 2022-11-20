require 'selenium-webdriver'
# require 'tesseract-ocr'
require 'open3'

driver = Selenium::WebDriver.for :chrome
driver.get "https://sushida.net/play.html"

sleep 7

canvas = driver.find_element(:id, '#canvas')
driver.action.move_by(canvas.location.x + 260, canvas.location.y + 260).click.perform
# コース選択
sleep 3
driver.action.click.perform
sleep 1

driver.action.click.perform
sleep 1
driver.action.key_down(:enter).key_up(:enter).perform
sleep 2
canvas.save_screenshot('page.png')
# 開始




# engine = Tesseract::Engine.new{ |engine|
#   engine.language = :jpn
# }

# engine.symbols_for('page.png').each_with_index{ |sym, i|
#   text = sym.text
#   b = sym.bounding_box
#   printf("%d | text=%s pos=(x:%d y:%d w:%d h:%d)\n", 
#       i, text, b.x, b.y, b.width, b.height)
# }



sleep 3