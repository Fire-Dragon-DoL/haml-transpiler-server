require "pathname"

ENV["RACK_ENV"] = "test"
SPEC_ROOT = Pathname.new(File.expand_path("../../", __FILE__)).freeze

$LOAD_PATH.unshift SPEC_ROOT.join("lib")

require "haml-transpiler-server"
require "rack/test"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[SPEC_ROOT.join("spec/support/**/*.rb")].each { |file| require file }

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include Support::Request,    type: :request
end
