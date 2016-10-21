require "erb"
require "yaml"
require "ghost/seeder/models/generic_seed/yaml_bindings"

module Ghost
  module Seeder
    module Models
      class GenericSeed
        class << self
          def perform_queries
            seeds.each do |record|
              new(record).seed!
            end
          end

          def wipe_records!
            Logger.warn "wiping", klass
            klass.destroy_all
          end

          def load_fixtures(identifier)
            YAML.load(
              ERB.new(
                File.read(
                  "./config/seed/fixtures/#{identifier}.yml"
                )
              ).result(YamlBindings.new.helper)
            )
          end

          def seeds
            load_fixtures klass.to_s.downcase.pluralize
          end
        end

        attr_reader :record, :attributes

        def initialize(attributes)
          @attributes = attributes
          # allow calling hash attributes as methods
          @record = OpenStruct.new(attributes)
        end

        def seed!
          if record_exists?
            Logger.info "#{self.class} exists:", record_slug
            raise "#{record_slug} not expected to exist!" if Runner.wipe_db?
          else
            create_record!
          end
        end

        private

        def first_user
          @first_user ||= User.first
        end

        def record_exists?
          self.class.klass.where(slug: record.slug).exists?
        end

        def record_slug
          record.slug
        end

        def create_record!
          self.class.klass.create(attributes_for_create)
          Logger.success self.class, record_slug
        end
      end
    end
  end
end
