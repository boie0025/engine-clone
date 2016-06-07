module Ahoy
  class Store < Ahoy::Stores::MongoidStore
    def visit_model
      Locomotive::Visit
    end

    def event_model
      Locomotive::VisitEvent
    end
  end
end

Ahoy.visit_duration = 30.minutes
Ahoy.cookie_domain = :all
Ahoy.geocode = false
Ahoy.quiet = false # conflicts with quiet_assets
