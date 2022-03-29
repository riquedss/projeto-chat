class Message < ApplicationRecord
    has_many :message_sents
    has_many :users, through: :message_sent
end
