class User < ApplicationRecord
    has_many :items
    has_one :inventory
    has_one :marketplace
    has_secure_password
    self.locking_column = :lock_version
end
