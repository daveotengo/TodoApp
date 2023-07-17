//
//  FirstViewController.swift
//  TodoApp
//
//  Created by David Oteng on 18/02/2021.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    var arrItem : [String] = []
    
    @IBOutlet weak var tableVw: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        //ßßprint(UserDefaults.standard.object(forKey: "aItem")!)
       
        if let aItemObjVal = UserDefaults.standard.object(forKey: "aItem") {
        
            if  let aItem = aItemObjVal as? [String] {
                
                arrItem = aItem
                
                
            }
            
       }
        
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")

        cell.textLabel?.text = arrItem[indexPath.row]


        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //tableVw.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let aItemObjVal = UserDefaults.standard.object(forKey: "aItem") {
        
            if  let aItem = aItemObjVal as? [String] {
                
                arrItem = aItem
                
                
                
            }
            
       }
        
        
        tableVw.reloadData()

    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            objects.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            arrItem.remove(at: indexPath.row)
            
            tableVw.reloadData()
            
            UserDefaults.standard.setValue(arrItem, forKey: "aItem")

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
