require_relative 'config'

DB.create_table? :quizzes do
  primary_key :id
  String :code, unique: true, null: false
  String :title, null: false
  String :description
end