module Lita
  module Handlers
    class Gimli < Handler
      class Buffer
        MAX_BUFFER_LENGTH = 2
        attr_reader :messages

        def log(message)
          messages << message
          truncate
        end

        def messages
          @messages ||= []
        end

        def needs_an_axe?
          messages.all? do |message|
            message.body.split(' ').first.upcase == "AND"
          end && messages.length == MAX_BUFFER_LENGTH
        end

        private

        def truncate
          if @messages.size > MAX_BUFFER_LENGTH
            @messages = messages[-MAX_BUFFER_LENGTH..-1]
          end
        end
      end

      class BufferRepository
        def self.buffers
          @buffers ||= {}
        end

        def self.buffer_for_room(room)
          buffers[room] ||= Buffer.new
        end
      end

      route %r{(.+)}, :log

      def log(response)
        buffer = get_buffer(response)
        buffer.log(response.message)

        if buffer.needs_an_axe?
          response.reply("AND MY AXE!")
        end
      end

      private

      def get_buffer(response)
        room = response.message.source.room
        BufferRepository.buffer_for_room(room)
      end
    end

    Lita.register_handler(Gimli)
  end
end
