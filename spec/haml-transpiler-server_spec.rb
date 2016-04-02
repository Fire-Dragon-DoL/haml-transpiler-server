require "spec_helper"
require "haml-transpiler-server"

describe HamlTranspilerServer do
  subject { described_class }

  it "has a version number" do
    expect(subject::VERSION).not_to be_nil
  end
end
