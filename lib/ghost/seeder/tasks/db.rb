module Ghost
  module Seeder
    module Tasks
      class Db
        include Rake::DSL if defined? Rake::DSL

        def load_tasks
          namespace :db do
            desc "set FORCE=true if you want to wipe"
            task :seed do
              puts "seeding!"
            end
          end
        end
      end
    end
  end
end

Ghost::Seeder::Tasks::Db.new.load_tasks
