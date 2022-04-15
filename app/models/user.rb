class User < ApplicationRecord
    has_many :messages

    enum kind: { user: 0, adm: 1 }

    validates :name, :nickname, :password_digest, :kind, presence: true
    validates :name, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
    validates :nickname, format: { with: /\A[a-zA-Z-0-9 ]+\z/, message: "only allows letters and numbers" }
    validates :name, :nickname, length: { minimum: 1 }, length: { maximum: 15 }
    validates :nickname, uniqueness: true
    validates :password_digest, length: { minimum: 6 }
    validate :format_date
    
    has_secure_password

    def is_adm? 
        self.kind == "adm"
    end

    def is_user?
        self.kind == "user"
    end

    def is_adm_or_is_user?
        is_adm? or is_user?
    end
    
    def format_date
        date = self.birth_date.split("-")

        unless date.length == 3
            errors.add(:format_date, message: "incorrect format")
        end

        format_dd(date)
        format_mm(date)
        format_aa(date)
    end

    def format_dd array
        day = array[0].to_i
        unless (day >= 0 && day <= 31)
            errors.add(:format_date, message: "incorrect day format")
        end
    end

    def format_mm array
        month = array[1].to_i
        unless (month <= 12)
            errors.add(:format_date, message: "incorrect month format")
        end
    end

    def format_aa array
        year = array[2].to_i
        unless (year >= 1900 && year <= 2022) #aplicação teste/entender como funciona na prática real
            errors.add(:format_date, message: "incorrect year format")
        end
    end
end