desc "Run all the tests"
task :default => [:test]

task :test do
  ruby "-I./lib;./test test/test.rb"
end

task :repl do
  ruby "-I./lib;./test ./ajlisprepl.rb"
end
