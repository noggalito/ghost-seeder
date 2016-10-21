require "ghost/seeder/runner"

module Ghost
  module Seeder
    module Tasks
      class Db
        include Rake::DSL if defined? Rake::DSL

        def load_tasks
          namespace :db do
            desc "set WIPE_DB if you want to wipe"
            task :seed do
              Ghost::Seeder::Runner.run
            end
          end
        end
      end
    end
  end
end

Ghost::Seeder::Tasks::Db.new.load_tasks
