class Group < ActiveRecord::Base
  paginates_per 5
  max_paginates_per 20

  belongs_to :company
  has_many :users, :dependent => :destroy

  validates :name, presence: true
end
