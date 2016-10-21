require "ghost/seeder/models/generic_seed"

module Ghost
  module Seeder
    module Models
      class SettingsSeed < GenericSeed
        class << self
          def klass
            Setting
          end

          def seeds
            super + [{
              key: "navigation",
              value: load_fixtures("navigation").to_json
            }]
          end

          def wipe_records!
            Logger.info "can't wipe", self
          end
        end

        def seed!
          setting.update!(value: record.value)
          Logger.success self.class, "#{record.key}:", record.value
        end

        private

        def setting
          Setting.find_by!(key: record.key)
        end
      end
    end
  end
end
