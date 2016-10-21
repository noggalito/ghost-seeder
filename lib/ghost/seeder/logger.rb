require "colorize"

module Ghost
  module Seeder
    class Logger
      class << self
        COLORS = {
          info: :white,
          warn: :yellow,
          success: :green
        }

        %w(
          warn
          info
          success
        ).map(&:to_sym).each do |level|
          define_method level do |msg, *details|
            color = COLORS[level]
            log(
              String(level).upcase.colorize(color),
              String(msg),
              String(details.join(" ")).colorize(:blue)
            )
          end
        end

        def log(*args)
          puts "[#{Time.now}] #{args.join(" ")}"
        end
      end
    end
  end
end
