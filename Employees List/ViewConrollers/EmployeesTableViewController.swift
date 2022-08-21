//
//  EmployeesTableViewController.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import UIKit

class EmployeesTableViewController: UITableViewController {
    
    private var employees: [Employees] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 100
        fetchEmployees()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeeCell else { return UITableViewCell() }
        cell.employeeName.text = employees[indexPath.row].name
        cell.employeePhone.text = employees[indexPath.row].phone_number
        cell.employeeSkills.text = employees[indexPath.row].skills.joined(separator: ", ")
        
        return cell
    }
    
    private func fetchEmployees() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { [self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let employeesJson = try JSONDecoder().decode(CompanyName.self, from: data)
                employees = employeesJson.company.employees
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(employees)
                
            } catch {
                
            }
        }.resume()
    }
}
