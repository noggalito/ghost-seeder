require "ghost/seeder/models/generic_seed"

module Ghost
  module Seeder
    module Models
      class SettingsSeed < GenericSeed
        DEFAULT_NAVIGATION = [
          { url: '/',           label: 'Inicio' },
          { url: '/coworking/', label: 'Coworking' },
          { url: '/emprendimientos/', label: 'Emprendimientos' },
          { url: '/tag/blog/', label: 'Blog' },
        ]
        DEFAULT_SETTINGS = [
          { key: "activeTheme", value: "prendho" },
          { key: "labs",        value: '{"publicAPI":true}' },
          { key: "logo",        value: '/default/prendho_logo_header.svg' },
          { key: "navigation",  value: DEFAULT_NAVIGATION.to_json }
        ]

        def self.seeds
          DEFAULT_SETTINGS
        end

        def self.wipe_records!
          Logger.info "can't wipe", self
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
