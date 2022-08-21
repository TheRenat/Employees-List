//
//  Employee.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import Foundation

struct Company: Decodable {
    let company: CompanyInfo
}

struct CompanyInfo: Decodable {
    let name: String
    let employees: [Employees]
}

struct Employees: Decodable { 
    let name: String
    let phone_number: String
    let skills: [String]
}

