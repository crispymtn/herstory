require 'rails_helper'

RSpec.describe ChangeLogger do
  context "when logging attribute changes" do
    before(:each) do
      @shipment = Shipment.create(pieces: 5)
      allow(@shipment).to receive(:log)
    end

    it "should log basic values" do
        @shipment.pieces = 4
        ChangeLogger.log_attribute_changes(@shipment, nil)
        expect(@shipment).to have_received(:log).with(
          type: "pieces_changed",
          user: nil,
          previous_value: 5,
          new_value: 4
        )
    end
  end
end
