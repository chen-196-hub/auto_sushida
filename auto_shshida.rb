require 'selenium-webdriver'
require 'open3'

driver = Selenium::WebDriver.for :chrome
driver.get "https://sushida.net/play.html"

sleep 7

canvas = driver.find_element(:id, '#canvas')
driver.action.move_by(canvas.location.x + 260, canvas.location.y + 260).click.perform 
# コース選択
sleep 2
case ARGV[0]
when 'easy', 'e'
  driver.action.move_by(0, -70).click.perform # お手軽
when 'normal', 'n'
  driver.action.click.perform
when 'hard', 'h'
  driver.action.move_by(0, 70).click.perform # 高級
else
  driver.action.click.perform
end

sleep 1

driver.action.click.perform
sleep 1
driver.action.key_down(:enter).key_up(:enter).perform
sleep 2

# 開始
num = 0
check = ""
the_same_count = 0 
while num <= 100 do
  canvas.save_screenshot('page.png')
  require_relative 'image_cutter'
  cut_imag(ARGV[0])
  text, _xxx, _yyy = Open3.capture3("tesseract cropped.jpg - -l eng")

  # puts text.strip

  content = text.strip.split(' ').sort_by{|x| -x.size}[0]

  File.open("log.txt", mode = "a"){|f|
    f.write(content)
    f.write('  ')
  }
  puts content

  if !content
    puts 'content is undefind'
    the_same_count += 1
    num = 101 if the_same_count == 5
    sleep 3
  else
    if check == content
      num = 101 if the_same_count == 5
      the_same_count += 1 
      puts "count!!#{the_same_count}"
    end

    content.split('').each do |i|
      driver.action.send_keys(i).perform
      # p i

      # sleep 0.03 # ほぼ無限
      sleep 0.06
      # sleep 0.1
    end
    check = content
  end
end

puts 'end'

sleep