module Domain
  module Quiz
    class Quiz
      attr_reader :id, :code, :title, :description, :questions
    end

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