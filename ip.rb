require 'socket'
module IP
  def self.gather_info
    host = Socket.gethostname
    ip = nil
    begin
      orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true

      UDPSocket.open do |s|
        s.connect '64.233.187.99', 1
        ip = s.addr.last
      end
    ensure
      Socket.do_not_reverse_lookup = orig
    end
    [host,ip]
  end
end