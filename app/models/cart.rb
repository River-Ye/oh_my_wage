class Cart
    attr_reader :users

    def initialize(users = [])
        @users = users
    end

    def add_item(user_id)
        found_user = @users.find{ |i| i.user_id == user_id }

        if found_user
          found_user.increment(1)
        else
          @users << Student.new(user_id)
        end
        # @users << student_id
      end
      
      def empty?
          @users.empty?
      end
end