require './test_helper.rb'
require './app'

RSpec.describe App do
  subject { described_class.new.call(params) }

  before do
    ENV['environment'] = 'test'
    File.open('test.txt', "w+") { |file| file.write(10000) }
  end

  describe '#deposit' do
    let(:params) do
      {
        "REQUEST_METHOD"=>"GET",
          "PATH_INFO"=>"/deposit",
          "QUERY_STRING"=>"value=30000"
        }
    end

    it 'increase amount in balance' do
      expect(subject).to eq([200, {'Content-Type' => 'text/html'}, ["<h1>Result: 40000.0</h1>", "<a href='/'>Home</a>"]])
    end
    
    context 'when amount is zero or less then zero' do
      let(:params) do
        {
          "REQUEST_METHOD"=>"GET",
            "PATH_INFO"=>"/random",
            "QUERY_STRING"=>"value=-1000"
          }
      end

      it 'raises an error' do
        expect(subject).to eq([404, {'Content-Type' => 'text/html'}, ["404"]])
      end
    end
  end

  describe '#withdraw' do
    let(:params) do
      {
        "REQUEST_METHOD"=>"GET",
          "PATH_INFO"=>"/withdraw",
          "QUERY_STRING"=>"value=5000"
        }
    end

    it 'reduces amount in balance' do
      expect(subject).to eq([200, {'Content-Type' => 'text/html'}, ["<h1>Result: 5000.0</h1>", "<a href='/'>Home</a>"]])
    end
    
    context 'when amount is more than current_amount' do
      let(:params) do
        {
          "REQUEST_METHOD"=>"GET",
            "PATH_INFO"=>"/withdraw",
            "QUERY_STRING"=>"value=15000"
          }
      end

      it 'indicates an error' do
        expect(subject).to eq([200, {"Content-Type"=>"text/html"}, ["<h1>Result: There is not enough money on your balance.</h1>", "<a href='/'>Home</a>"]]
        )
      end
    end
    
    context 'when amount is zero or less then zero' do
      let(:params) do
        {
          "REQUEST_METHOD"=>"GET",
            "PATH_INFO"=>"/random",
            "QUERY_STRING"=>"value=30000"
          }
      end
            
      it 'indicates an error' do
        expect(subject).to eq([404, {'Content-Type' => 'text/html'}, ["404"]])
      end
    end
  end
  
  describe '#balance' do
    let(:params) do
      {
        "REQUEST_METHOD"=>"GET",
          "PATH_INFO"=>"/balance",
          "QUERY_STRING"=>"value=30000"
        }
      end

    it 'shows current balance' do
      expect(subject).to eq([200, {'Content-Type' => 'text/html'}, ["<h1>Result: 10000.0</h1>", "<a href='/'>Home</a>"]])
    end

  end
end
