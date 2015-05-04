module Lita
  module Handlers
    class Gimli < Handler
      class Fellowship
        BOROMIR_AND_LEGOLAS_COUNT = 2
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
          end && messages.length == BOROMIR_AND_LEGOLAS_COUNT
        end

        private

        def truncate
          if @messages.size > BOROMIR_AND_LEGOLAS_COUNT
            @messages = messages[-BOROMIR_AND_LEGOLAS_COUNT..-1]
          end
        end
      end

      class FellowshipRepository
        def self.fellowships
          @fellowships ||= {}
        end

        def self.fellowship_for_room(room)
          fellowships[room] ||= Fellowship.new
        end
      end

      route %r{(.+)}, :contribute_an_axe

      def contribute_an_axe(response)
        fellowship = get_fellowship(response)
        fellowship.log(response.message)

        if fellowship.needs_an_axe?
          response.reply("AND MY AXE!")
        end
      end

      private

      def get_fellowship(response)
        room = response.message.source.room
        FellowshipRepository.fellowship_for_room(room)
      end
    end

    Lita.register_handler(Gimli)
  end
end
