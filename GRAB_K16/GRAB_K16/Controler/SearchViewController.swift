//
//  SearchViewController.swift
//  GRAB_K16
//
//  Created by Dương Văn Cường on 12/12/2022.
//

import UIKit
import CoreLocation

protocol SearchViewControllerDelegate: AnyObject {
    func searchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?)
}

class SearchViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: SearchViewControllerDelegate?

    private let lable: UILabel = {
       let lable = UILabel()
        lable.text = "Bạn ở đâu?"
        lable.font = . systemFont(ofSize: 24, weight: .semibold)
        return lable
    }()
    
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Chọn điểm đến"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        return field
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(lable)
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(field)
        tableView.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        field.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .secondarySystemBackground
    }
    
    var locations = [Location]()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lable.sizeToFit()
        lable.frame = CGRect(x: 10, y: 10, width: lable.frame.size.width, height: lable.frame.size.height)
        
        field.frame = CGRect(x: 10, y: 20+lable.frame.size.height, width: view.frame.size.width-20, height: 50)
        
        let tableY: CGFloat = field.frame.origin.y+field.frame.size.height+5
        tableView.frame = CGRect(x: 0, y: tableY, width: view.frame.size.width, height: view.frame.size.height-tableY)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.resignFirstResponder()
        if let text = field.text, !text.isEmpty {
            LocationManager.shared.findLocations(with: text) {
                [weak self] locations in
                DispatchQueue.main.async {
                    self?.locations = locations
                    self?.tableView.reloadData()
                }
            }
        }
        return true
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = locations[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.contentView.backgroundColor = .secondarySystemBackground
        cell.backgroundColor = .secondarySystemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let coordinate = locations[indexPath.row].coordinates
        
        delegate?.searchViewController(self, didSelectLocationWith: coordinate)
    }
}
