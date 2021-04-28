require 'rails_helper'

RSpec.describe TestApi, type: :model do
  context 'validation tests' do 
    it 'ensures fakeId presence' do
      test_api = TestApi.new(	 title: "enim quo cumque", body: "ut voluptatum aliquid illo tenetur nemo sequi quo ...", userId: 4	).save
      expect(test_api).to eq(false)
    end

    it 'ensures title presence' do
      test_api = TestApi.new(	fakeId:2, body: "quo et expedita modi cum officia ...", userId: 2	).save
      expect(test_api).to eq(false)
    end

    it 'ensures body presence' do
      test_api = TestApi.new( fakeId:5,	 title: "provident vel ut sit ratione",  userId: 4	).save
      expect(test_api).to eq(false)
    end

    it 'ensures userId presence' do
      test_api = TestApi.new( fakeId:7,	 title: "quibusdam", body: "odi cum officia veludiand aeverosed accusamus veritatis error ..."	).save
      expect(test_api).to eq(false)
    end

    it 'should save successfully' do
      test_api = TestApi.new(	fakeId:1, title: "enim quo cumque", body: "ut voluptatum aliquid illo tenetur nemo sequi ...", userId: 4	).save
      expect(test_api).to eq(true)
    end
  end

  context 'validation tests' do 
  end
end
