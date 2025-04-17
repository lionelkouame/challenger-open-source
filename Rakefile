# Rakefile

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task default: :test

namespace :db do
  desc 'Setup the database schema'
  task :setup do
    require_relative './db/schema'
    puts 'Database schema created.'
  end
end
