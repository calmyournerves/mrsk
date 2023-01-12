require "sshkit"

module Mrsk::Commands
  class Base
    attr_accessor :config

    def initialize(config)
      @config = config
    end

    private
      def docker(*args)
        args.compact.unshift :docker
      end

      # Copied from SSHKit::Backend::Abstract#redact to be available inside Commands classes
      def redact(arg) # Used in execute_command to hide redact() args a user passes in
        arg.to_s.extend(SSHKit::Redaction) # to_s due to our inability to extend Integer, etc
      end      
  end
end