module Domain
  module Quiz
    class Challenge
      attr_reader :id, :code, :title, :description, :questions
      def initialize(id, code, title, description)
        @id = id
        @code = code
        @title = title
        @description = description
        @questions = []
      end

      def add_question(question)
        @questions << question
      end

    end
  end
end