require 'selenium-webdriver'
# require 'tesseract-ocr'
require 'open3'
require_relative 'image_cutter'

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

num = 0
while num < 100 do
  canvas.save_screenshot('page.png')

  cut_imag
  text, _xxx, _yyy = Open3.capture3("tesseract cropped.jpg - -l eng")

  puts text.strip

  content = text.strip.split(' ').sort_by{|x| -x.size}[0]


  File.open("text.txt", mode = "a"){|f|
    f.write(content) 
    f.write('\n')
  }
  puts content
  content.split('').each do |i|
    driver.action.send_keys(i).perform
    p i
    sleep 0.1
  end
  num = num + 1
end



sleep