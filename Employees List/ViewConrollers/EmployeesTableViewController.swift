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
        view.backgroundColor = .blue
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
            .responseJSON{ dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let employeesData = value as? [String: Any] else { return }
                    print(employeesData)
                    let employee = Avito(company: employeesData["company"] as? Company
                    )
                    print(employee)
                case .failure(let error):
                    print(error)
            }
    }
}
}
