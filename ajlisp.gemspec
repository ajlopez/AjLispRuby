Gem::Specification.new do |s|
  s.name        = 'ajlisp'
  s.version     = '0.0.0'
  s.date        = '2013-03-09'
  s.summary     = "AjLisp Interpreter"
  s.description = "Lisp interpreter that can access and invoke Ruby libraries and classes"
  s.authors     = ["Angel 'Java' Lopez"]
  s.email       = 'webmaster@ajlopez.com'
  s.files       = ["lib/ajlisp.rb"]
  s.homepage    =
    'http://github.com/ajlopez/AjLispRuby'
  s.files = Dir[
    "LICENSE",
    "README.md",
    "lib/**/*.rb",
    "lib/**/*.lsp",
    "*.gemspec",
    "test/*.*"
  ]
end