%w[rubygems rake rake/clean rake/testtask fileutils macro_development_toolkit].each { |f| require f }

Dir['tasks/**/*.rake'].each { |t| load t }

desc "Runs all unit tests"
task :test => ['test:units']

