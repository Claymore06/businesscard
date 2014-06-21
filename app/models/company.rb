class Company < ActiveRecord::Base
  has_many :groups, :dependent => :destroy
  
  paginates_per 5
  max_paginates_per 20
  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :tel, format: { with:/\A\d{2,4}-\d{2,4}-\d{2,4}\z/, allow_blank: true, allow_nil: true}, length: { maximum: 13 }
  validates :fax, format: { with:/\A\d{2,4}-\d{2,4}-\d{2,4}\z/, allow_blank: true, allow_nil: true }, length: { maximum: 13 }
  validates :url, presence: true, length: { maximum: 56 }
end
