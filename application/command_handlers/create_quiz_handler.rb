include Domain::Quiz

module Application
  module CommandHandlers
    class CreateQuizHandler
      def initialize(quiz_repository)
        unless quiz_repository.is_a?(QuizRepository)
          raise ArgumentError, 'quiz_repository must be an instance of Domain::Quiz::QuizRepository'
        end

        @quiz_repository = quiz_repository
      end

      def call(command)
        quiz = Quiz.new( command.id, command.code, command.title, command.description)

        @quiz_repository.save(quiz)
      end
    end
  end
end