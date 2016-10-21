require "ghost/seeder/models/generic_seed"

module Ghost
  module Seeder
    module Models
      class PostTagsSeed < GenericSeed
        def self.klass
          PostTag
        end

        def self.seeds
          load_fixtures("posts_tags").map do |post_tag|
            tag = Tag.find_by! slug: post_tag["tag_slug"]
            post = Post.find_by! slug: post_tag["post_slug"]
            {
              tag_id: tag.id,
              post_id: post.id
            }
          end
        end

        private

        def record_exists?
          self.class.klass.where(attributes).exists?
        end

        def record_slug
          return "[tag:#{record.tag_id} <-> post:#{record.post_id}]"
        end

        def attributes_for_create
          attributes
        end
      end
    end
  end
end
