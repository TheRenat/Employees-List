//
//  ViewController.swift
//  Employees List
//
//  Created by Renat Ibragimov on 11.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let employees = try JSONDecoder().decode(Company.self, from: data)
                print(employees)
            } catch let error {
                print(error)
            }
        }.resume() 
    }
}

