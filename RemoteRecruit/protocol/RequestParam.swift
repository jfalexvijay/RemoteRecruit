//
//  ApiSecret.swift
//  RemoteRecruit
//
//  Created by Alex Antony Vijay J on 15/06/26.
//

protocol RequestParam: Encodable, Decodable {
    var country: String {
        get set
    }
}
