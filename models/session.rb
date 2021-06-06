class Session < ApplicationRecord
  belongs_to :campaign
  has_many :notes
  scope :latest, -> { order(created_at: :desc).limit(1).first }
end
