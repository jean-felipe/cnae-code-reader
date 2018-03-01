module Trades
  class Read < Read
    include Filter

    private

    def collection
      @collection ||= apply_custom_filters(Trade.all, filters: filters)
    end
  end
end
