require "socket"

class Display
  PANEL_WIDTH = 144
  NUM_PANELS  = 1
  TOTAL_WIDTH = PANEL_WIDTH * NUM_PANELS
  HEIGHT      = 120
  
  EMPTY_LINE = " " * TOTAL_WIDTH
  
  attr_reader :ips, :port, :socket
  
  def initialize(ips, port)
    @ips = ips
    @port = port
    @socket ||= UDPSocket.new(Socket::AF_INET6)
  end
  
  def show(frame)
    frame = pad_frame(frame)
    bytes = [[], [], []]
    NUM_PANELS.times do |panel|
      HEIGHT.times do |row|
        byte = ""
		  PANEL_WIDTH.times do |col|
          byte += frame[row][panel * PANEL_WIDTH + col] != " " ? "1" : "0"
          if byte.length == 8
            bytes[panel] << byte.to_i(2)
            byte = ""
          end
        end
      end
      socket.send bytes[panel].pack("c" * (PANEL_WIDTH * HEIGHT / 8)), 0, ips[panel], port
    end
  end
  
  # Pad frame with blank lines and spaces so we get exactly 120 lines, containing 144 characters each.
  def pad_frame(frame)
    frame = frame.map{ |line| line[[0, (line.length - TOTAL_WIDTH) / 2].max.to_i, TOTAL_WIDTH].center(TOTAL_WIDTH) }
    blank_lines = HEIGHT - frame.size
    [EMPTY_LINE] * (blank_lines / 2.0).ceil + frame + [EMPTY_LINE] * (blank_lines / 2.0).floor
  end
end