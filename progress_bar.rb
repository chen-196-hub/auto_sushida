sym = [
  '\\',
  '|',
  '/',
  '-'
]

def green(str)
  "\e[32m#{str}\e[0m"
end

1.upto(100) do |i|
  print "\r"
  print " (#{sym[i % sym.length]}) ["
  print ('/' * (i / 10)).ljust(10, ' ') << ']'
  sleep 0.03
end

8.times do |i|
  print "\r"
  print ' (o) [ '
  print green('ALL DONE'[0, i + 1].ljust(8, '.'))
  print ' ]'
  sleep 0.1
end