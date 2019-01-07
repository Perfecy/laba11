class Result < ApplicationRecord
#  validates :param, uniqueness: true
  validates :param, presence: true
  validates :res, presence: true
end
