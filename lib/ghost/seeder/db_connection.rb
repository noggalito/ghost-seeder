require "active_record"

module Ghost
  module Seeder
    class DbConnection
      def initialize(environment)
        @environment = environment
        configure!
      end

      def connect!
        ActiveRecord::Base.establish_connection(
          @connection_options
        )
      end

      def disconnect!
        ActiveRecord::Base.connection.disconnect!
      end

      private

      def configure!
        case @environment
        when "development"
          @db_gem = "sqlite3"
          require(@db_gem)
          monkey_patch_sqlite3!
          @connection_options = {
            adapter: @db_gem,
            database: Dir.pwd + "/content/data/ghost-dev.db"
          }
        else
          @db_gem = "pg"
          require(@db_gem)
          db = URI.parse(ENV.fetch("DATABASE_URL"))
          @connection_options = {
            host: db.host,
            encoding: "utf8",
            username: db.user,
            password: db.password,
            database: db.path[1..-1],
            adapter: db.scheme == "postgres" ? "postgresql" : db.scheme
          }
        end
      end

      def monkey_patch_sqlite3!
        require "ghost/seeder/monkey_patch_sqlite3"
      end
    end
  end
end
