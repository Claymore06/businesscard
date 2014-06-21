class Group < ActiveRecord::Base
  belongs_to :company
  has_many :users, :dependent => :destroy
  paginates_per 5
  max_paginates_per 20
  validates :name, presence: true
end
