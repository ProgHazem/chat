class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, length: {minimum: 1}
  scope :custem_message, -> { order(:created_at).last(20)}
end
