//
//  Annonce.swift
//  ListLeboncoin
//
//  Created by Sylla on 05/05/2022.
//

import Foundation
struct Annonce: Decodable {
    let id: Int
    let category_id: Int
    let title: String
    let description: String
    let price: Float
    let images_url: String
    let creation_date: String
    let is_urgent: Bool
    let name: String
}
struct Image_Url: Decodable{
    let small: String?
    let thumb: String?
}


