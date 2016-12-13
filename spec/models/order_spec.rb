require "rails_helper"

RSpec.describe Order, :type => :model do
  it "creates order" do
    filter_coffee = Order.create!({"name"=>"filter coffee", "quantity"=>"1445", "milk"=>"whole fat", "size"=>"small", "payment"=>"paid"})
    expect(filter_coffee).to be_a_kind_of(Order)
  end

  it "does not create order if the validations are false" do
    filter_coffee = Order.create!({"name"=>"filter coffee", "quantity"=>"1445", "milk"=>"whole fat", "size"=>"small", "payment"=>"paid"})
    filter_coffee.name = nil
    expect(filter_coffee).to be_invalid
  end
end
