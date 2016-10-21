require "ghost/seeder/models/generic_seed"

module Ghost
  module Seeder
    module Models
      class TagsSeed < GenericSeed
        def self.klass
          Tag
        end

        private

        def attributes_for_create
          attributes.merge(
            created_by: first_user.id,
            updated_by: first_user.id
          )
        end
      end
    end
  end
end
