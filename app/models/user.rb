class User < ActiveRecord::Base

	validates :name,                 length: { maximum: 10 }, uniqueness: true, presence: true
	validates :phone,     length: { maximum: 10 }, presence: true
	validates :address, length: { maximum: 30 }, presence: true
	

end
