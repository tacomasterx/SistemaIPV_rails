require 'rails_helper'

RSpec.describe Shop, type: :model do
  it 'ensures name presence' do
    shop = Shop.new(	 pseudonym: "MATRIZ", address: "Matrizlandia 001 col. La Matrix", city: "Zion" 	).save
    expect(shop).to eq(false)
  end
end
