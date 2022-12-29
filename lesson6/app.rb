require 'rack'
require './atm'

class App
    def call(env)
      req = Rack::Request.new(env)

      params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h
      params.merge!('operation' => req.path.gsub('/', ''))
  
      case req.path
      when '/deposit', '/withdraw', '/balance'
        result = atm_controller(params)
        [200, {'Content-Type' => 'text/html'}, ["<h1>#{result}</h1>", "<a href='/'>Home</a>"]]
      else
        [404, {'Content-Type' => 'text/html'}, ["404"]]
      end
    end

    def atm_controller(params)
      atm = Atm.new(params['value'].to_i)
  
      case params['operation']
      when 'deposit'
        atm.deposit
      when 'withdraw'
        atm.withdraw
      when 'balance'
        atm.balance
      end
  
      "Result: #{atm.result_amount ? atm.result_amount : atm.errors}"
    end
end
