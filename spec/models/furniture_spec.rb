require 'rails_helper'

RSpec.describe Furniture, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should belong_to(:room) }

    end

    describe "InDirect Associations" do

    it { should have_one(:home) }

    it { should have_one(:design) }

    end

    describe "Validations" do

    end
end
