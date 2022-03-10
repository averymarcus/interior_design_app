require 'rails_helper'

RSpec.describe Room, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:furniture_items) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
