class Project < ApplicationRecord
  validates :name, presence: true
  has_many :tickets, dependent: :delete_all  # delete_all is faster than destroy
end
