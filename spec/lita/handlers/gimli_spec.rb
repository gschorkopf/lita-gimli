require "spec_helper"

describe Lita::Handlers::Gimli, lita_handler: true do
  it { is_expected.to route("Anything").to(:log) }

  describe "#contribute_an_axe" do
    context "two foos have been contributed" do
      it "contributes an axe" do
        send_message "AND you'll have my sword..."
        send_message "AND my bow!"
        expect(replies.last).to eq("AND MY AXE!")
      end
    end

    context "no foos have been contributed" do
      it "does nothing" do
        send_message "share the load, frodo"
        expect(replies.last).to be_nil
      end
    end

    context "only one foos has been contributed" do
      it "does nothing" do
        send_message "AND my bow!"
        expect(replies.last).to be_nil
      end
    end
  end
end
