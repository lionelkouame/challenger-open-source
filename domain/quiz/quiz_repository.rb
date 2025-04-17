module Domain
  module Quiz
    class QuizRepository
      def save(quiz)
        raise NotImplementedError, 'This method should be overridden in a subclass'
      end

      def find_by_id(id)
        raise NotImplementedError, 'This method should be overridden in a subclass'
      end
    end
  end
end