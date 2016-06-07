module Locomotive
  module Middlewares

    class Ahoy
      attr_accessor :app, :env

      def initialize(app, opts = {})
        self.app = app
      end

      def call(env)
        self.env = env
        track!
        app.call(env)
      end

      private

      def track!
        tracker.track_visit
        # Matching this: https://github.com/ankane/ahoy/blob/v1.4.0/vendor/assets/javascripts/ahoy.js#L242
        tracker.track('$view', view_properties, {})
      end

      def tracker
        @tracker ||= ::Ahoy::Tracker.new(request: request)
      end

      def request
        @request ||= ActionDispatch::Request.new(env)
      end

      def view_properties
        {
          url: env["REQUEST_PATH"],
          site_name: engine_site.name
        }
      end

      def engine_site
        @engine_site ||= env['locomotive.site']
      end


    end

  end
end
