class Phone < ApplicationRecord
  validates_presence_of :make, :model, :serial
end
