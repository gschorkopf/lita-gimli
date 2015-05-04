module Lita
  module Handlers
    class Gimli < Handler
      route %r{(.+)}, :log

      def log(response)
        if needs_an_axe?(response)
          response.reply("AND MY AXE!")
        end
      end

      def needs_an_axe?(response)
        response.message.body.split(' ').first == "AND"
      end
    end

    Lita.register_handler(Gimli)
  end
end
