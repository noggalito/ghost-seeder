require "ghost/seeder/models/generic_seed"
require "redcarpet"

module Ghost
  module Seeder
    module Models
      class PostsSeed < GenericSeed
        def self.klass
          Post
        end

        private

        def attributes_for_create
          defaults.merge(attributes).merge(
            author_id: first_user.id,
            created_by: first_user.id,
            updated_by: first_user.id,
            published_by: first_user.id,
            html: redcarpet.render(record.markdown)
          )
        end

        def defaults
          {
            created_at: Time.now,
            updated_at: Time.now,
            published_at: Time.now,
            page: false,
            featured: false,
            language: "en_US",
            status: "published",
            uuid: yaml_bindings_helper(:uuid)
          }
        end

        def redcarpet
          Redcarpet::Markdown.new(
            Redcarpet::Render::HTML.new(hard_wrap: true)
          )
        end
      end
    end
  end
end
