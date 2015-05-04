require "spec_helper"

describe Lita::Handlers::Gimli, lita_handler: true do
  it { is_expected.to route("Anything").to(:log) }

  describe "#contribute_an_axe" do
    context "two foos have been contributed" do
      it "contributes an axe" do
        send_message "and you'll have my sword..."
        send_message "AND my bow!"
        expect(replies.last).to eq("AND MY AXE!")
      end
    end
  end
end
