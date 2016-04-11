module Ahoy
  class Store < Ahoy::Stores::MongoidStore
    def visit_model
      Locomotive::Visit
    end

    def EventModel
      Locomotive::VisitEvent
    end
  end
end

Ahoy.visit_duration = 30.minutes
Ahoy.cookie_domain = :all
Ahoy.geocode = :async
Ahoy.quiet = false # conflicts with quiet_assets
