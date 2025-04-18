# Rakefile

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task default: :test

namespace :db do
  desc 'Create the database if it does not exist'
  task :create do
    require 'sequel'
    require 'dotenv/load'

    env = ENV['APP_ENV'] || 'dev'
    if env == 'dev'
      Dotenv.load('.env.dev')
    elsif env == 'test'
      Dotenv.load('.env.test')
    elsif env == 'prod'
      Dotenv.load('.env.prod')
    else
      raise "Unknown environment: #{env}"
    end

    db_name = ENV['POSTGRES_DB']
    db_user = ENV['POSTGRES_USER']
    db_password = ENV['POSTGRES_PASSWORD']

    Sequel.connect(
      adapter: 'postgres',
      user: db_user,
      password: db_password,
      host: 'localhost',
      port: 5432,
      database: 'postgres' # Connexion à la base par défaut
    ) do |connection|
      unless connection.fetch("SELECT 1 FROM pg_database WHERE datname = ?", db_name).any?
        connection.run("CREATE DATABASE #{db_name}")
        puts "Database '#{db_name}' created."
      else
        puts "Database '#{db_name}' already exists."
      end
    end
  end

  desc 'Drop the database'
  task :drop do
    require 'sequel'
    require 'dotenv/load'

    env = ENV['APP_ENV'] || 'dev'
    if env == 'dev'
      Dotenv.load('.env.dev')
    elsif env == 'test'
      Dotenv.load('.env.test')
    elsif env == 'prod'
      Dotenv.load('.env.prod')
    else
      raise "Unknown environment: #{env}"
    end

    db_name = ENV['POSTGRES_DB']
    db_user = ENV['POSTGRES_USER']
    db_password = ENV['POSTGRES_PASSWORD']

    Sequel.connect(
      adapter: 'postgres',
      user: db_user,
      password: db_password,
      host: 'localhost',
      port: 5432,
      database: 'postgres' # Connexion à la base par défaut
    ) do |connection|
      connection.run("DROP DATABASE IF EXISTS #{db_name}")
      puts "Database '#{db_name}' dropped."
    end
  end

  desc 'Setup the database schema'
  task :setup do
    require_relative './db/schema'
    puts 'Database schema created.'
  end
end

