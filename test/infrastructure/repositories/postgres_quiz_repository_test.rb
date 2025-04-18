require 'minitest/autorun'
require_relative '../../../domain/quiz/challenge'
require_relative '../../../infrastructure/repositories/postgres_quiz_repository'

class PostgresQuizRepositoryTest < Minitest::Test
  def setup
    @repo = Infrastructure::Repositories::PostgresQuizRepository.new

    DB[:quizzes].truncate
  end

  def test_save_and_find_by_id
    quiz = Domain::Quiz::Challenge.new( 1,  'RB101',  'Ruby Basics','Test your Ruby knowledge')

    @repo.save(quiz)
    retrieved = @repo.find_by_id(42)

    refute_nil retrieved
    assert_equal quiz.id, retrieved.id
    assert_equal quiz.code, retrieved.code
    assert_equal quiz.title, retrieved.title
    assert_equal quiz.description, retrieved.description
  end
end