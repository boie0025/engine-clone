module Locomotive
  class VisitEvent
    include Mongoid::Document

    # associations
    belongs_to :visit

    # fields
    field :name, type: String
    field :properties, type: Hash
    field :time, type: Time

    def site_id
      @site_id ||= begin
        properties['site_id'].presence ||
        properties['site_handle'].presence
      end
    end

    def site
      if site_id
        Site.or({ _id: site_id }, { handle: site_id }).first
      end
    end

  end
end
