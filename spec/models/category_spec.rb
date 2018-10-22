require 'rails_helper'
require 'pry'

RSpec.describe Category, type: :model do
  context 'Associations' do
  	it 'has_many posts' do
  		association = described_class.reflect_on_association(:posts)
  		puts association
  		binding.pry
  		expect(association.macro).to eq :has_many
  	end
  end
end
