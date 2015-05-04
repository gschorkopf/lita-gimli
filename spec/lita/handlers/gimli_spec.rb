require "spec_helper"

describe Lita::Handlers::Gimli, lita_handler: true do
  it { is_expected.to route("Anything").to(:log) }
end
