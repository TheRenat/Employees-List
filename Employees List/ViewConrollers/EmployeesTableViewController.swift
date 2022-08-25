//
//  EmployeesTableViewController.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import UIKit

class EmployeesTableViewController: UITableViewController {
    
    // MARK: - Private properties
    private var employees: [Employees] = []
    private var networkManager = NetworkManager()
    
    // MARK: - overide UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        networkManager.fetchEmployees(url: Link.link.rawValue) { [weak self] getEmployees in
            self?.employees = getEmployees.company.employees
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeCell else { return UITableViewCell() }
        cell.employeeName.text = "Name: \(employees[indexPath.row].name)"
        cell.employeePhone.text = "Phone: \(employees[indexPath.row].phone_number)"
        cell.employeeSkills.text = "Skills: \(employees[indexPath.row].skills.joined(separator: ", "))"
        return cell
    }
}
