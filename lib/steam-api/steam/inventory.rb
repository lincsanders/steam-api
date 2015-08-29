# -*- encoding: utf-8 -*-
module Steam
  # IEconService functionality wrapper
  # for https://developer.valvesoftware.com/wiki/Steam_Web_API/IEconService
  # created by github.com/lincsanders
  # Also, fuck documentation and testing. #YOLO

  module Inventory
    # Status values that an CEcon_TradeOffer can have
    INVALID         = 1
    ACTIVE          = 2
    ACCEPTED        = 3
    COUNTERED       = 4
    EXPIRED         = 5
    CANCELLED       = 6
    DECLINED        = 7
    INVALID_ITEMS   = 8
    EMAIL_PENDING   = 9
    EMAIL_CANCELLED = 10

    def self.trade_offers(params: {})
      response = client.get 'GetTradeOffers/v1', params: params
      response.parse_key('response')
    end

    def self.sent_offers(params: {})
      params[:get_sent_offers] = 1
      self.trade_offers(params).parse_key('trade_offers_sent')
    end

    def self.received_offers(params: {})
      params[:get_received_offers] = 1
      self.trade_offers(params).parse_key('trade_offers_received')
    end

    def self.trade_offer(tradeofferid, params: {})
      params[:tradeofferid] = tradeofferid
      response = client.get 'GetTradeOffer/v1', params: params
      response.parse_key('response')
    end

    def self.decline_trade_offer(tradeofferid, params: {})
      params[:tradeofferid] = tradeofferid
      response = client.get 'DeclineTradeOffer/v1', params: params
      response.parse_key('response')
    end

    def self.cancel_trade_offer(tradeofferid, params: {})
      params[:tradeofferid] = tradeofferid
      response = client.get 'CancelTradeOffer/v1', params: params
      response.parse_key('response')
    end

    def self.client
      build_client 'IEconService'
    end
  end
end
