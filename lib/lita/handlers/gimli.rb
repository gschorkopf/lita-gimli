module Lita
  module Handlers
    class Gimli < Handler
      route %r{(.+)}, :log

      def log(response)
        response.reply("AND MY AXE!")
      end
    end

    Lita.register_handler(Gimli)
  end
end
