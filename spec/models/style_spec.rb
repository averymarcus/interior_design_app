require 'rails_helper'

RSpec.describe Style, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:rooms) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
