class Message < ApplicationRecord
    belongs_to :user

    validates :content, length: { minimum: 4 }, length: { maximum: 400 }, presence: true
end
