require 'mini_magick'

def cut_imag(arg = 'n')
  image = MiniMagick::Image.open('page.png')
  # image.colorspace('Gray')

  # （横幅x下から上+左右+上下)
  size = case  arg
         when 'easy', 'e'
           '200x35+150+225'
         when 'normal', 'n'
           '270x35+115+225'
         when 'hard', 'h'
           '330x35+85+225'
         else
           '270x35+115+225'
         end
  # hardrange '300 100' ~ '330 85' ~ ' 360  70 '

  image.crop(size).write(File.expand_path('./cropped.jpg'))
  # MiniMagick::Tool::Convert.new do |magick|
  #   magick << 'cropped.jpg'
  #   magick.negate
  #   magick.threshold('007%')
  #   magick.negate
  #   magick << 'cropped.jpg'
  # end
end
cut_imag
