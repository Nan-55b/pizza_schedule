require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      schedule = build(:schedule)
      expect(schedule).to be_valid
    end

    it "is invalid without a title" do
      schedule = build(:schedule, title: nil)
      expect(schedule).not_to be_valid
    end
  end
end
