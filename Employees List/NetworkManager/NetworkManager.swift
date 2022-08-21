//
//  NetworkManager.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import Foundation


enum Link: String {
    case link = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
}

struct NetworkManager {
    func fetchEmployees(url: String, completion: @escaping(Company) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }

            do {
                let jsonCompany = try JSONDecoder().decode(Company.self, from: data)
                completion(jsonCompany)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
