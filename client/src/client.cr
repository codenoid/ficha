require "./client/*"
require "kemal"
require "kemal-session"
require "option_parser"

Session.config.cookie_name = "xda"
Session.config.secret = "32h5908hfua89g2w3fxG3ptZ3ou "
Session.config.timeout = 3600.hours # 150 day
Session.config.gc_interval = 2.minutes
SOCKETS = [] of HTTP::WebSocket

sip = ""
skey = ""
port = 2121
OptionParser.parse! do |parser|
  parser.banner = "Usage: ./ficha --cmd [arguments]"
  parser.on("-ip ip", "--ip=ip", "Ficha active server ip / host") { |csip| sip = csip }
  parser.on("-key key", "--key=key", "Server secret key") { |cskey| skey = cskey }
  parser.on("-port port", "--port=port", "Set your port") { |cport| port = cport }
  parser.on("-h", "--help", "Show this help") { puts parser }
end

module Client
  get "/" do |env|
    if !env.session.string?("sip")
      env.session.string("sip", sip)
    end
    if !env.session.string?("skey")
      env.session.string("skey", skey)
    end
    render "src/views/main.ecr"
  end
end

Kemal.config.port = port.to_i
Kemal.config.env = "production"
Kemal.run
