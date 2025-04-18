require 'minitest'
require_relative '../../../domain/quiz/challenge'

class QuizTest < Minitest::Test

  def test_initialisation
    quiz = Challenge.new(1, 'QZ001', 'Ruby Basics', 'This is a test quiz')
    assert_equal 1, quiz.id
    assert_equal 'QZ001', quiz.code
    assert_equal 'Ruby Basics', quiz.title
    assert_equal 'This is a test quiz', quiz.description
  end
end