module Locomotive
  class VisitEvent
    include Mongoid::Document

    # associations
    belongs_to :visit
    belongs_to :user

    # fields
    field :name, type: String
    field :properties, type: Hash
    field :time, type: Time
  end
end
