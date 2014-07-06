require "cronies/version"
require "fileutils"

module Cronies

  class Base

    def initialize(script_name, ttl=600)
      @lock_file = "#{script_name}.lock"
      @time_now = Time.now
      @ttl = ttl
    end

    def lock
      log_line

      # singleton script
      if File.exist?(@lock_file)
        timestamp = File.open(@lock_file).read
        if Time.now.to_i - timestamp.to_i > @ttl
          log_now "Delete lock file because older than #{@ttl/60} minutes"
          FileUtils.rm_f(@lock_file)
        else
          log_now "Lock file found, cron job skipped"
          exit
        end
      end

      log_now "Create lock file - #{@lock_file}"
      File.open(@lock_file, "w") do |f|
        f.puts Time.now.to_i
      end
    end

    def unlock
      log_now "Script completed, deleting lock file"
      FileUtils.rm_rf(@lock_file)
      log_line
    end

    private

    def log_line
      log_now("#{'-' * 40}")
    end

    def log_now(msg)
      puts "#{@time_now} - #{msg}"
    end

  end

end
