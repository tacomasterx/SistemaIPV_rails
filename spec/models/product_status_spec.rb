require 'rails_helper'

RSpec.describe ProductStatus, type: :model do
  context 'scope tests' do
    let (:params) {  { name: 'Status' }  }#, managable: 1
    before(:each) do
      ProductStatus.new(params.merge(managable: 1)).save
      ProductStatus.new(params.merge(managable: 0)).save
      ProductStatus.new(params.merge(managable: 0)).save
      ProductStatus.new(params.merge(managable: 0)).save
    end

    it 'should return managable product statuses' do
      expect(ProductStatus.managable_statuses.size).to eq(1)
    end 

    it 'should return unmanagable product statuses' do
      expect(ProductStatus.unmanagable_statuses.size).to eq(3)
    end 

    it 'should return as option product statuses' do
      expect(ProductStatus.as_option.size).to eq(2)
    end

  end
end
