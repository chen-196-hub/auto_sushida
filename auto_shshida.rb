require 'selenium-webdriver'
require 'open3'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://sushida.net/play.html'

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
check = ''
the_same_count = 0
while num <= 100
  canvas.save_screenshot('page.png')
  require_relative 'image_cutter'
  cut_imag(ARGV[0])
  text, _xxx, _yyy = Open3.capture3('tesseract cropped.jpg - -l eng')

  content = text.strip.split(' ').sort_by { |x| -x.size }[0]

  File.open('text.txt', mode = 'a') do |f|
    f.write(content)
    f.write('  ')
  end

  if !content
    # puts 'content is undefind'
    the_same_count += 1
    print "\r"
    print " [ "
    print "XXXXX"[0, the_same_count].ljust(5, '.')
    print ' ]'
    num = 101 if the_same_count == 5
    sleep 3
  else
    if check == content
      num = 101 if the_same_count == 5
      the_same_count += 1
      puts "count!!#{the_same_count}"
      print "\r"
      print " [ "
      print "XXXXX"[0, the_same_count].ljust(5, '.')
      print ' ]'
    end

    sym = [
      '\\',
      '|',
      '/',
      '-'
    ]
    content.split('').each_with_index do |i, idx|
      driver.action.send_keys(i).perform
      # progress start
      print "\r"
      print " (#{content.split('').size == idx + 1 ? 'o' : sym[idx % sym.length]}) [ "
      print content[0, idx + 1].ljust(content.size, '.')
      print ' ]'
      # sleep 0.03 # ほぼ無限
      sleep 0.06 # 割と安定
      # sleep 0.1
    end
    puts ''
    # progress end

    check = content
  end
end

puts 'end'

sleep
