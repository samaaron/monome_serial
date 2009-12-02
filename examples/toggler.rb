require 'rubygems'
require 'monome_serial'

thread = MonomeSerial::Examples::Toggle.new.start
thread.join

