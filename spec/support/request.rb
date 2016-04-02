require "haml-transpiler-server/cli"

module Support
  module Request
    def app
      HamlTranspilerServer::CLI
    end
  end
end
