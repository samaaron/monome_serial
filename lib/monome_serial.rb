#require external libraries
require 'activesupport'
require 'fcntl'

require 'monome_serial/serial_communicator'
require 'monome_serial/serial_communicator/communicator'
require 'monome_serial/serial_communicator/dummy_communicator'
require 'monome_serial/serial_communicator/binary_patterns/series'
require 'monome_serial/serial_communicator/binary_patterns/fourtyh'
require 'monome_serial/monome_communicator'
require 'monome_serial/examples/toggle'

module MonomeSerial
  class NoMonomesFoundError < StandardError ; end

  def self.detect_monome
    ttys = find_ttys
    if ttys.empty? then
      raise NoMonomesFoundError,
      "No monomes were found connected to your computer"
    end

    MonomeCommunicator.new(ttys.first)
  end

  def self.find_ttys
    possible_monome_io_file_matchers = ['/dev/ttyUSB*', '/dev/tty.usbserial-m*']
    files = possible_monome_io_file_matchers.inject([]) do |files, to_try|
      files << Dir[to_try]
    end

    files.flatten!
  end
end

