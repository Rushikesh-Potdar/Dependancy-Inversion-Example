//
//  CoursesViewController.swift
//  MyAppUIKit
//
//  Created by Rushikesh Potdar on 17/01/23.
//

import UIKit

public protocol DataFetchable{
    func fetchCourseNames(completion : @escaping ([String])-> Void)
}

struct Course{
    let name : String
}
public class CoursesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    public let dataFetchable : DataFetchable
    
    private let tableView : UITableView = {
        let table = UITableView()
        table.register(UITableView.self, forCellReuseIdentifier: "Cell")
        return table
    }()
    
    public init(dataFetchable : DataFetchable){
        self.dataFetchable = dataFetchable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var courses : [Course] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        dataFetchable.fetchCourseNames(completion: { [weak self] arr in
            self?.courses = arr.map({Course(name: $0)})
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        })
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = courses[indexPath.row].name
        return cell
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
