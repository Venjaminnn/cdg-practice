require './test_helper.rb'
require './atm'

RSpec.describe Atm do
  subject { described_class.new(amount) }

  let(:amount) { 5000 }

  before do
    ENV['environment'] = 'test'
    File.open('test.txt', "w+") { |file| file.write(10000) }
  end

  after do
    File.open('test.txt', "w+")
  end
 
  describe '#deposit' do
    it 'increase amount in balance' do
      expect(subject.deposit).to eq(15000)
    end
   
    context 'when amount is zero or less then zero' do
      let(:amount) { -100 }
   
      it 'raises an error' do
        expect(subject.deposit).to eq("Enter an amount greater than 0.")
      end
    end
  end

  describe '#withdraw' do
    let(:amount) { 5000 }

    it 'reduces amount in balance' do
      expect(subject.withdraw).to eq(5000)
    end
   
    context 'when amount is more than current_amount' do
      let(:amount) { 12000 }
      
      it 'indicates an error' do
        expect(subject.withdraw).to eq("There is not enough money on your balance.")
      end
    end
   
    context 'when amount is zero or less then zero' do
      let(:amount) { 0 }
      
      it 'indicates an error' do
        expect(subject.withdraw).to eq("Enter an amount greater than 0 or equal to your balance.")
      end
    end
  end

  describe '#balance' do
    it 'shows current balance' do
      expect(subject.balance).to eq(10000.0)
    end
  end
end
