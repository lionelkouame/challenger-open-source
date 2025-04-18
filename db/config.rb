require 'bundler/setup'
require 'sequel'
require 'dotenv/load'

# Load environment variables from .env file
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


DB = Sequel.connect(
  adapter: 'postgres',
  user: ENV['POSTGRES_USER'],
  password: ENV['POSTGRES_PASSWORD'],
  host: 'localhost',
  port: 5432,
  database: ENV['POSTGRES_DB']
)
