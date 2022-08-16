//
//  EmployeesTableViewController.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import UIKit
import Alamofire

class EmployeesTableViewController: UITableViewController {
    
    private var employees: [Employees] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        fetchEmployees()
        print(employees)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeCell else { return UITableViewCell() }
        let employee = employees[indexPath.row]
        cell.configureCell(with: employee)
        return cell
    }
}

extension EmployeesTableViewController {
    
    private func fetchEmployees() {
        AF.request(link)
            .validate()
            .responseJSON{ [weak self] dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let employeesData = value as? [String: Any] else { return }
                    print(employeesData)
                    for (key, _) in employeesData {
                        let emplo = key["employees"] as? [Any] ?? []
                        print(emplo)
                    }
//                    for employeeData in employeesData {
//                        let employee = Employees(
//                            name: employeeData["name"] as? String ?? "",
//                            phone_number: employeeData["phone_number"] as? String ?? "",
//                            skills: employeeData["skills"] as? [String] ?? []
//                        )
//                        self?.employees.append(employee)
//                    }
//                    self?.tableView.reloadData()
//print(employeesData)
                    
                    
                case .failure(let error):
                    print(error)
            }
    }
}
}
