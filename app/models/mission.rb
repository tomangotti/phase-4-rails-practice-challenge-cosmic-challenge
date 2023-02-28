class Mission < ApplicationRecord
  belongs_to :scientist
  belongs_to :planet

  validates :name, :planet_id, :scientist_id, presence: true
  validates :scientist_id, uniqueness: {scope: name}
end

