require "minitest/autorun"

require_relative '../../../../application/commands/create_quiz'

include Application::Commands

class CreateQuizTest < Minitest::Test
  def test_command_initialisation
    command = CreateQuiz.new( 1,  "quiz_code", "quiz_title","quiz_description")
    assert_equal 1, command.id
    assert_equal "quiz_code", command.code
    assert_equal "quiz_title", command.title
    assert_equal "quiz_description", command.description
  end
end
