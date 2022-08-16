//
//  NetworkManager.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import Foundation

let link = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
