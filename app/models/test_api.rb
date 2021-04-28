class TestApi < ApplicationRecord
    validates :fakeId, presence: true
    validates :title, presence: true
    validates :body, presence: true
    validates :userId, presence: true
end
