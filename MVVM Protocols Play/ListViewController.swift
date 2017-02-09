//
//  ListViewController.swift
//  MVVM Protocols Play
//
//  Created by Andy Bell on 08/02/2017.
//  Copyright © 2017 snapp. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var isLoaded: Bool = false
    var viewModel: ListViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            refreshDisplay()
        }
    }
    
    func refreshDisplay()
    {
        if let viewModel = viewModel , isLoaded {
            title = viewModel.title
        } else {
            title = ""
        }
        self.tableView?.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        isLoaded = true
        refreshDisplay()
        
        print("LIST VC CORD: \(self.viewModel?.coordinatorDelegate)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        cell.textLabel?.text = viewModel?.itemAtIndex(indexPath.row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.useItemAtIndex(indexPath.row)
    }
    
}

extension ListViewController: ListViewModelViewDelegate {
    func itemsDidChange(viewModel: ListViewModel) {
        tableView.reloadData()
    }
}
