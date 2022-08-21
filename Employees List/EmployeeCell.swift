//
//  EmployeeCell.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import UIKit

class EmployeeCell: UITableViewCell {
    @IBOutlet var employeeName: UILabel!
    @IBOutlet var employeePhone: UILabel!
    @IBOutlet var employeeSkills: UILabel!
    
    func configureCell(with employee: Employees) {
        
        employeeName.text = employee.name
        employeePhone.text = employee.phone_number
        employeeSkills.text = employee.skills.joined(separator: ", ")
        }
    }


