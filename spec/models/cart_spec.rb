require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:cart) { Cart.new }

  describe "cart基本功能" do
    it "可以把student丟到cart裡，然後cart裡就有student" do

      cart = Cart.new
      expect(cart).to be_empty
      
      cart.add_item(1)
      expect(cart.empty?).to be false
      expect(cart.present?).to be true
    end

    it "student可以放到cart裡，也可以再拿出來" do
      u1 = create(:user)
      u2 = create(:user)

      cart.add_item(u1.id)
      cart.add_item(u2.id)
        
      expect(cart.items.first.user).to be_a User
      expect(cart.items.first.user_id).to be u1.id
    end
  end
end