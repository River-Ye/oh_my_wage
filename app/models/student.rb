class Student
    attr_reader :user_id
    def initialize(user_id)
        @user_id = user_id
    end

    def increment(n = 1)
        @quantity += n
    end

    def user
        User.find_by(id: @user_id)
    end
end