//
//  Employee.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import Foundation

struct Avito {
    let company: Company?
}

struct Company {
    let name: String
    let employees: [Employees]?
}

struct Employees {
    let name: String
    let phone_number: String
    let skills: [String]
}

