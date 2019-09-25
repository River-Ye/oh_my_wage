require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:cart) { Cart.new }
end
describe "購物車基本功能" do
  it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do

    cart = Cart.new
    expect(cart).to be_empty
    
    cart.add_item(1)
    expect(cart.empty?).to be false
    expect(cart.present?).to be true
end
  it "商品可以放到購物車裡，也可以再拿出來" do
    u1 = create(:student)
    u2 = create(:student)

    cart.add_item(u1.id)
    cart.add_item(u2.id)
      
    expect(cart.items.first.student).to be_a Student
    expect(cart.items.first.student_id).to be u1.id
end

end