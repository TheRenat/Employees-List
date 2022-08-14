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
        //print(employees)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(1)
                return
            }
            do {
                self.employees = try JSONDecoder().decode([Employees].self, from: data)
                print(2)
            } catch let error {
                print(error)
            }
        }.resume()
//
//    guard let url = URL(string: link) else { return }
//
//         URLSession.shared.dataTask(with: url) { data, response, error in
//             guard let data = data else {
//                 print(error?.localizedDescription ?? "No error description")
//                 return
//             }
//             do {
//                 let employees = try JSONDecoder().decode(Company.self, from: data)
//                 print(employees)
//             } catch let error {
//                 print(error)
//             }
//         }.resume()
}
}
