class Cart
    attr_reader :users

    def initialize(students = [])
        @students = students
    end

    def add_item(user_id)
        found_student = @students.find{ |i| i.student_id == student_id }

        if found_student
          found_student.increment(1) 
        else
          @students << Student.new(user_id)
        end
        # @students << user_id
      end
      
      def empty?
          @students.empty?
      end
end