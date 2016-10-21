require "ghost/seeder/models/generic_seed"

module Ghost
  module Seeder
    module Models
      class PostsSeed < GenericSeed
        def self.klass
          Post
        end

        private

        def attributes_for_create
          html = "<p>#{record.markdown.split("\n").join("</p><p>")}</p>"
          defaults.merge(attributes).merge(
            author_id: first_user.id,
            created_by: first_user.id,
            updated_by: first_user.id,
            published_by: first_user.id,
            html: html
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
      end
    end
  end
end
