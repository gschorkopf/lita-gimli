module Lita
  module Handlers
    class Gimli < Handler
      route %r{(.+)}, :log

      def log(response)
      end
    end

    Lita.register_handler(Gimli)
  end
end
