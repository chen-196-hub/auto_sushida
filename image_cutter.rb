require 'mini_magick'

def cut_imag
  image = MiniMagick::Image.open('page.png')
  # image.colorspace('Gray')
  
  image.crop('270x35+115+225').write(File.expand_path('./cropped.jpg'))
  # MiniMagick::Tool::Convert.new do |magick|
  #   magick << 'cropped.jpg'
  #   magick.negate
  #   magick.threshold('007%')
  #   magick.negate
  #   magick << 'cropped.jpg'
  # end

end
cut_imag