require_relative '../../domain/quiz/challenge'
require_relative '../../domain/quiz/quiz_repository'
require_relative '../../db/config'

include Domain::Quiz

module Infrastructure
  module Repositories
    class PostgresQuizRepository < Challenge::QuizRepository
      def save(quiz)
        DB[:quizzes].insert_conflict(target: :id, update: {
          code: quiz.code,
          title: quiz.title,
          description: quiz.description
        }).insert(
          id: quiz.id,
          code: quiz.code,
          title: quiz.title,
          description: quiz.description
        )
      end

      def find_by_id(id)
        record = DB[:quizzes][id: id]
        return nil unless record

        Challenge.new(
          record[:id],
           record[:code],
           record[:title],
           record[:description]
        )
      end

    end

  end
end