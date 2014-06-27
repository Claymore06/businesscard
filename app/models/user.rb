class User < ActiveRecord::Base
  paginates_per 5
  max_paginates_per 10

  belongs_to :group
  has_many :name_cards, :dependent => :destroy

  validates :name, presence: true, length: { maximum: 13 }
  validates :mail, format: { with: /[\S]+\@[\S]+\.[A-Za-z0-9_\.\-]+[\S]/, allow_nil: true, allow_blank: true } 
  validates :tel, format: { with:/\A\d{2,4}-\d{2,4}-\d{2,4}\z/, allow_blank: true, allow_nil: true}, length: { maximum: 13 }

end
