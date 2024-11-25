//
//  boxersTableViewController.swift
//  bestBoxers_HomeWork
//
//  Created by Bekzat on 25/11/24.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class boxersTableViewController: UITableViewController {
    
    var arrayBoxers = [bestBoxer]()
    var isLoading = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // arrayBoxers.append(bestBoxer(name: "test", birthDate: "test", title: "test"))
        // tableView.reloadData()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
        tableView.refreshControl = refreshControl
        loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    
    @objc func handleRefresh() {
        if !isLoading {
            isLoading = true
            
            arrayBoxers.removeAll()
            tableView.reloadData()
            
            loadData() //загрузка данных
            
            
        }
        
    }
    
    func loadData() {
        SVProgressHUD.show()
        AF.request("https://demo1504989.mockable.io/bestBoxer", method: .get).responseData { response in
            SVProgressHUD.dismiss()
            self.isLoading = false
            self.refreshControl?.endRefreshing()
            
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print(json)
                
                if let resultArray = json.array {
                    for item in resultArray {
                        let boxerItem = bestBoxer(json: item)
                        self.arrayBoxers.append(boxerItem)
                    }
                    self.tableView.reloadData()
                }
            }
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayBoxers.count
    }

     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! boxersTableViewCell
        
        cell.setData(boxer: arrayBoxers[indexPath.row])
        
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
