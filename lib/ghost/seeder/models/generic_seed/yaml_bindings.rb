require "securerandom"
require "faker"

module Ghost
  module Seeder
    module Models
      class GenericSeed
        class YamlBindings
          def helper
            binding
          end

          private

          def uuid
            SecureRandom.uuid
          end

          def lipsum
            Faker::Hipster.paragraph(5, true, 5)
          end

          def lipsum_small
            Faker::Hipster.paragraph(2, true, 2)
          end

          # def lipsum_html
          #   Faker::Lorem.paragraph(5, true, 5)
          # end
          #
          # def lipsum_small
          #   Faker::Lorem.sentence
          # end

          def fake_sentence
            Faker::Hipster.sentence
          end
        end
      end
    end
  end
end
