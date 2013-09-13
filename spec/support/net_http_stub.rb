require 'net/http'

class Net::HTTP
  def request_with_localhost_check(request, body = nil, &block)
    unless %w(localhost 127.0.0.1 0.0.0.0).include?(address)
      puts "Attempt to make Net::HTTP request to non-localhost: #{address.to_s}#{request.path}"
      raise "Attempt to make Net::HTTP request to non-localhost: #{address.to_s}#{request.path}"
    else
      request_without_localhost_check(request, body, &block)
    end
  end
  alias_method :request_without_localhost_check, :request
  alias_method :request, :request_with_localhost_check
end

