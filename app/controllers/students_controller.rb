class StudentsController < ActionController::Base
    before_action :find_user, only: [:index, :show]

    def index
        @users = User.all
    end

    def show
    end

    def add_to_cart
        current_cart.add_item(@product.id)
        session[:cart9527] = current_cart.serialize
    
        redirect_to products_path, notice: '已加入購物車'
      end
    

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end
    
    def user_params
    params.require(:user).permit(:name, :number, :email, :role, :subject, :phone, :gender)
    end
end