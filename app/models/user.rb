class User < ApplicationRecord
    has_secure_password
    
    has_many :messages

    enum kind: { user: 0, adm: 1 }

    validates :name, :nickname, presence: true
    validates :name, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
    validates :nickname, format: { with: /\A[a-zA-Z-0-9 ]+\z/, message: "only allows letters and numbers" }
    validates :name, :nickname, length: { minimum: 1 }, length: { maximum: 15 }
    validates :nickname, uniqueness: true
    validates :password, length: { minimum: 6 }
end