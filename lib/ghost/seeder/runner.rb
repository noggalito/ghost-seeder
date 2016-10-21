require "ghost/seeder/logger"
require "ghost/seeder/ar_models"
require "ghost/seeder/db_connection"
require "ghost/seeder/models/tags_seed"

module Ghost
  module Seeder
    class Runner
      class << self
        def run
          new(environment).run
        end

        def environment
          ENV["NODE_ENV"] || "development"
        end

        def wipe_db?
          ENV["WIPE_DB"]
        end
      end

      attr_reader :environment

      def initialize(environment)
        @environment = environment
      end

      def run
        db.connect!
        Logger.warn "seeding database for", environment
        klasses.each do |klass|
          klass.wipe_records! if self.class.wipe_db?
          klass.perform_queries
          Logger.success klass
        end
        db.disconnect!
        Logger.success "finished seeding!"
      end

      private

      def db
        @db ||= DbConnection.new(environment)
      end

      def klasses
        [
          Models::TagsSeed,
          # PostsSeed,
          # SettingsSeed,
          # PostTagsSeed
        ]
      end
    end
  end
end
