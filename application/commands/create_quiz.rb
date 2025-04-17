
module Application
  module Commands
    class CreateQuiz
      attr_reader :id, :code, :title, :description
      def initialize(id, code, title, description)
        @id = id
        @code = code
        @title = title
        @description = description
        @questions = []
      end
    end
  end
end

