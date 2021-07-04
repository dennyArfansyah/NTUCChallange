//
//  ListController.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 04/07/21.
//

import UIKit
import Foundation

class ListController: UITableViewController {
    
    private var timelines = [Timeline]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupDataSource()
    }
    
    private func setupTableView() {
        tableView.register(CourseCellView.self, forCellReuseIdentifier: CourseCellView.reusedIdenfier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 50
        tableView.rowHeight = 100
    }
    
    private func setupDataSource() {
        guard let path = Bundle.main.path(forResource: "/dummydata", ofType: ".json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            timelines = try JSONDecoder().decode([Timeline].self, from: data)
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return timelines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelines[section].courses.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        subView.backgroundColor = .white
        
        let topVerticalLine = UIView()
        topVerticalLine.backgroundColor = .gray
        let yearButton = UIButton()
        if timelines[section].courses.count == 0 {
            topVerticalLine.frame = CGRect(x: 45, y: 0, width: 1, height: 15)
            yearButton.frame = CGRect(x: 25, y: 15, width: 40, height: 15)
            yearButton.titleLabel?.font = UIFont.systemFont(ofSize: 11)
            yearButton.backgroundColor = .lightGray
        } else {
            topVerticalLine.frame = CGRect(x: 45, y: 0, width: 1, height: 10)
            yearButton.frame = CGRect(x: 20, y: 10, width: 50, height: 20)
            yearButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            yearButton.backgroundColor =   UIColor(red: 254/255, green: 224/255, blue: 231/255, alpha: 1)
        }
        
        yearButton.layer.cornerRadius = 5
        let year = timelines[section].year
        yearButton.setTitleColor(.black, for: .normal)
        yearButton.setTitle(year, for: .normal)
        
        let verticalLineheight = subView.frame.height - 10 - yearButton.frame.height
        let bottomVerticalLine = UIView(frame: CGRect(x: 45, y: 30, width: 1, height: verticalLineheight))
        bottomVerticalLine.backgroundColor = .gray
        
        if section != 0 {
            subView.addSubview(topVerticalLine)
        }
        subView.addSubview(yearButton)
    
        if section != timelines.count-1 {
            subView.addSubview(bottomVerticalLine)
        }
        
        return subView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        let course = timelines[indexPath.section].courses[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseCellView.reusedIdenfier, for: indexPath) as! CourseCellView
        cell.setupData(with: course)
        return cell
    }
    
}
