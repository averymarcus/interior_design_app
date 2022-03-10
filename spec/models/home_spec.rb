require "rails_helper"

RSpec.describe Home, type: :model do
  describe "Direct Associations" do
    it { should have_many(:rooms) }
  end

  describe "InDirect Associations" do
    it { should have_many(:furniture_items) }
  end

  describe "Validations" do
  end
end
