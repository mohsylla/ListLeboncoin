//
//  Ads.swift
//  ListLeboncoin
//
//  Created by Sylla on 30/04/2022.
//

import Foundation

struct Ads: Decodable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Float
    let images_url: ImageUrl
    let creation_date: String
    let is_urgent: Bool
}
struct ImageUrl: Decodable{
    let small: String?
    let thumb: String?
}

struct ID: Decodable {
    let id : Int
    let name: String
}
