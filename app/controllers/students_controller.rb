class StudentsController < ActionController::Base
    before_action :find_user, only: [:index, :show]

    def index
        
    end

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end
    
    def user_params
    params.require(:user).permit(:name, :number, :email, :role, :subject, :phone, :gender)
    end
end