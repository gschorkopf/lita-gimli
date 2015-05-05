require "spec_helper"

describe Lita::Handlers::Gimli, lita_handler: true do
  it { is_expected.to route("Anything").to(:contribute_an_axe) }

  describe "#contribute_an_axe" do
    context "two fellowship members have contributed" do
      it "contributes an axe" do
        send_message "AND you'll have my sword..."
        send_message "AND my bow!"
        expect(replies.last).to eq("AND MY AXE!")
      end

      context "another fellowship member contributes after Gimli pipes in" do
        it "Gimli only contributes one axe" do
          send_message "AND you'll have my sword..."

          expect{
            send_message "AND my bow!"
          }.to change(replies, :count).by 1

          expect {
            send_message "AND also some other weapon!"
          }.to_not change(replies, :count)
        end
      end

      context "fellowship member messages are case insensitive" do
        it "contributes an axe" do
          send_message "and you'll have my sword..."
          send_message "AnD my bow!"
          expect(replies.last).to eq("AND MY AXE!")
        end
      end
    end

    context "no fellowship members have contributed" do
      it "does nothing" do
        send_message "share the load, frodo"
        expect(replies.last).to be_nil
      end
    end

    context "only one fellowship member has contributed" do
      it "does nothing" do
        send_message "AND my bow!"
        expect(replies.last).to be_nil
      end
    end
  end
end
