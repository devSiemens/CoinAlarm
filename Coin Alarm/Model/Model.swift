//
//  Model.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import Foundation

struct Crypto : Codable {
    
    let id: String?
    let name: String?
    let symbol: String?
    let currency: String?
    let price: String?
    let logoURL: String?
}

/*
 {
     "id": "BTC",
     "currency": "BTC",
     "symbol": "BTC",
     "name": "Bitcoin",
     "logo_url": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
     "status": "active",
     "price": "39054.54862184",
     "price_date": "2022-03-15T00:00:00Z",
     "price_timestamp": "2022-03-15T15:06:00Z",
     "circulating_supply": "18984100",
     "max_supply": "21000000",
     "market_cap": "741415456492",
     "market_cap_dominance": "0.4157",
     "num_exchanges": "414",
     "num_pairs": "86116",
     "num_pairs_unmapped": "7346",
     "first_candle": "2011-08-18T00:00:00Z",
     "first_trade": "2011-08-18T00:00:00Z",
     "first_order_book": "2017-01-06T00:00:00Z",
     "rank": "1",
     "rank_delta": "0",
     "high": "67598.58724400",
     "high_timestamp": "2021-11-08T00:00:00Z",
     "1d": {
       "volume": "29513834886.48",
       "price_change": "112.61411534",
       "price_change_pct": "0.0029",
       "volume_change": "555537706.42",
       "volume_change_pct": "0.0192",
       "market_cap_change": "2171951819.78",
       "market_cap_change_pct": "0.0029"
     },
     "30d": {
       "volume": "993080810051.30",
       "price_change": "-3069.06438654",
       "price_change_pct": "-0.0729",
       "volume_change": "18234703946.74",
       "volume_change_pct": "0.0187",
       "market_cap_change": "-57118421171.73",
       "market_cap_change_pct": "-0.0715"
     }
 */
