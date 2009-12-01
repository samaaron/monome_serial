require 'monome_serial'

module MonomeSerial
  module Examples
    class Toggle
      def initialize
        monome_io_file = "/dev/ttyUSB0"
        @monome = MonomeSerial.detect_monome
        @light_lit = Hash.new(false)
      end

      # Enter a loop in which you read events from the monome and if the
      # event is a :keypress, then toggle the led on the monome
      def start
        Thread.new do
          loop do
            action, x, y = @monome.read
            toggle_led(x,y) if action == :keydown
          end
        end
      end

      private

      def toggle_led(x,y)
        toggle_led_on_monome(x,y)
        toggle_led_status(x,y)
      end

      # Depending on the state of the @light_lit hash for the given
      # coordinates, extinguish or illuminate the monome's lamp
      def toggle_led_on_monome(x,y)
        if @light_lit[x,y]
          @monome.extinguish_lamp(x,y)
        else
          @monome.illuminate_lamp(x,y)
        end
      end

      def toggle_led_status(x,y)
        @light_lit[x,y] = !@light_lit[x,y]
      end
    end
  end
end

#To run:
#thread = MonomeSerial::Examples::Toggle.new.start
#thread.join

