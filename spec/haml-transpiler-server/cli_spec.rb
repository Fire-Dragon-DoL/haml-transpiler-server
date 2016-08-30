require "spec_helper"
require "haml-transpiler-server/cli"

describe HamlTranspilerServer::CLI, type: :request do
  describe "/test" do
    subject { last_response.status }

    it "is 204" do
      get "/test"

      is_expected.to eq 204
    end
  end

  describe "/content" do
    context "with valid request" do
      subject { last_response.body }

      it "doesn't raise" do
        post "/content", content: "%div hello world"

        is_expected.to eq "<div>hello world</div>\n"
      end
    end

    context "with invalid request" do
      subject { last_response }

      it "is not ok" do
        post "/content", content: "- ruby_method_that_does_not_exist"

        is_expected.not_to be_ok
      end
    end

    context "with empty request" do
      subject { last_response.body }

      it "is empty when nothing passed" do
        post "/content"

        is_expected.to be_empty
      end
    end
  end

  describe "/path" do
    let(:file) { SPEC_ROOT.join("spec", "support", "file.html.haml").to_s }
    let(:not_existent_file) { SPEC_ROOT.join("spec", "support", "null").to_s }

    context "with valid request" do
      subject { last_response.body }

      it "doesn't raise" do
        post "/path", path: file

        is_expected.to eq "<div>hello world</div>\n"
      end
    end

    context "with not existent path" do
      subject { last_response }

      it "is not ok" do
        post "/path", path: not_existent_file

        is_expected.not_to be_ok
      end
    end

    context "with empty request" do
      subject { last_response }

      it "is not ok" do
        post "/path"

        is_expected.not_to be_ok
      end
    end
  end
end
