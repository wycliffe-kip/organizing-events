class User < ActiveRecord::Base
    has_many :reviews 
    has_many :events, through: :reviews
end 
