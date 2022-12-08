//
//  DetailViewController.swift
//  collection
//
//  Created by Lisette Antigua on 12/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var selectedData:String?

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "\(selectedData!) "
        label.text = selectedData
        // Do any additional setup after loading the view.
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
extension DetailViewController:UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        return cell
//        let j = filteredJobs[indexPath.section].jobs[indexPath.row]
//        //let announce2 = tourneys.section[indexPath.row]
//       
//        cell.textLabel?.text = j.name
//        cell.detailTextLabel?.text = j.description + j.requirements
//        
//        
//        cell.imageView?.image = j.image
//
//
//        return cell
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
