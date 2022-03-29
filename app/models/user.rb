class User < ApplicationRecord
    has_many :message_sents, optional: true
    has_many :messages, through: :message_sent
end
