//
//  ResentCostsTableViewController.swift
//  FinancialTracker
//
//  Created by Admin on 09.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import UIKit

class ResentCostsTableViewController: UITableViewController {

    var viewModel: RecentCostsViewModel = RecentCostsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        fetch()
    }

    func fetch() {
        viewModel.fetch { [unowned self]
            self.tableView.reloadData()
        }
    }
    
    // MARK: Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BudgetItemTableViewCell.reuseIdentifier, for: indexPath) as! BudgetItemTableViewCell

        let cellVM = viewModel.getCostVMForIndexPath(indexPath)
        
        cell.amountLabel.text = String(cellVM.amount)
        cell.categoryLabel.text = cellVM.category

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: - Events

extension ResentCostsTableViewController {
    @IBAction func addNewCostAction(sender: Any) {
        viewModel.addNewCost(
            amount: [100, 200, 50].randomElement()!,
            category:  ["Food", "Transport", "Other"].randomElement()!)
        
        fetch()
    }
}
