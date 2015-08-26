# -*- encoding: utf-8 -*-
module Steam
  # Inventory and IEconService functionality wrapper
  # created by github.com/lincsanders
  module Inventory
    def self.trade_offers(steamid, params: {})
      params[:steamid] = steamid
      response = client.get 'GetTradeOffers/v1', params: params
      response.parse_key('response')
    end

    def self.trade_offer(tradeofferid, params: {})
      params[:tradeofferid] = tradeofferid
      response = client.get 'GetTradeOffer/v1', params: params
      response.parse_key('response')
    end

    def self.client
      build_client 'IEconService'
    end
  end
end
