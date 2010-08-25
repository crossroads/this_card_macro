namespace :test do

  Rake::TestTask.new(:units) do |t|
    t.libs << "test/unit"
    t.pattern = 'test/unit/*_test.rb'
    t.verbose = true
  end

end

