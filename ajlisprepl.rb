require('ajlisp')

ARGV.each do |filename|
  puts "Processing " + filename
  AjLisp::PrimitiveLoad.instance.apply(AjLisp.context, ARGV)
end

ARGV.clear

puts "ajlisp simple repl"

AjLisp.repl

