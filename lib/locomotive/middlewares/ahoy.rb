module Locomotive
  module Middlewares

    class Ahoy
      attr_accessor :app, :env

      def initialize(app, opts = {})
        self.app = app
      end

      def call(env)
        self.env = env
        track_visit!
        app.call(env)
      end

      private

      def track_visit!
        tracker.track_visit
      end

      def tracker
        @tracker ||= ::Ahoy::Tracker.new(request: request)
      end

      def request
        @request ||= ActionDispatch::Request.new(env)
      end

      # def engine_site
      #   @engine_site ||= env['locomotive.site']
      # end

    end

  end
end
