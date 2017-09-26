require "./ficha/*"
require "kemal"
require "kemal-session"
require "option_parser"
require "db"
require "sqlite3"

Session.config.cookie_name = "ficha"
Session.config.secret = "32h5908hfu89g2w3fxG3ptZ3ou "
Session.config.timeout = 3600.hours # 150 day
Session.config.gc_interval = 2.minutes
SOCKETS = [] of HTTP::WebSocket

upcase = "development" # default, development
dbfile = "e" # path to db file
wperm = "n" # write permission
port = 2000 # server port
sqlite = [".sqlite", ".sql", ".sqlite3"] # sqlite file extention
OptionParser.parse! do |parser|
  parser.banner = "Usage: ./ficha --cmd [arguments]"
  parser.on("-port PORT", "--port=PORT", "Set the port") { |cport| port = cport }
  parser.on("-dbpath PATH", "--dbpath=PATH", "path to sqlite, or .cha file") { |cpath| dbfile = cpath }
  parser.on("-write", "--write", "write permission to db file") { wperm = "y" }
  parser.on("-h", "--help", "Show this help") { puts parser }
end

module Ficha
  # server test
  get "/" do 
    "active"
  end
  
  # we use web socket
  ws "/" do |socket|
    SOCKETS << socket
    n = 0
    if dbfile != "e"
      File.open(dbfile, "r") do |f|
        f.each_line do |line|
          n += 1
          anu = line
          if n == 1 && anu.includes?("format") # sqlite format
            puts "this is sqlite 3 file"       # SQLITE COMMAND
            db = DB.open "sqlite3://" + dbfile # + dbfile
            at_exit { db.close } # not sure
            db.query "select data from main_posts" do |msg|
              msg.each do
                rd = msg.read(String)
                socket.send n("m") + ":" + n("s") + "(+)" + rd
              end
            end
          else # text plain format
            socket.send n("m") + ":" + n("s") + "(+)" + line
          end
        end
      end
    end
    socket.on_message do |message|
      if dbfile != "e"
        File.open(dbfile, "r") do |f|
          f.each_line do |line|
            n += 1
            anu = line
            if n == 1 && anu.includes?("format") # sqlite format
              puts "this is sqlite 3 file"       # SQLITE COMMAND
              db = DB.open "sqlite3://" + dbfile
              at_exit { db.close }
              db.exec "insert into main_posts (data) VALUES (?)", message
            else # text plain format
              File.open(dbfile, "a") do |file| # Write chat (save)
                file.puts message + " \n"
              end
            end
          end
        end
      end
      socket.send n("m") + ":" + n("s") + "(+)" + message
    end
    socket.on_close do
      SOCKETS.delete socket
    end
  end
end

Kemal.config.port = port.to_i # port, default 2000 L#17
Kemal.config.env = "production" # static mode :D
Kemal.run # run Kemal App

# current minute or second
def n(w)
  t = Time.now
  if w == "m"
    return t.minute.to_s
  else
    return t.second.to_s
  end
end
