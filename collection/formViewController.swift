//
//  formViewController.swift
//  collection
//
//  Created by Lisette Antigua on 12/7/22.
//

import UIKit

class formViewController: UIViewController {
    @IBOutlet weak var addNewText: UITextField!
    
    var data:String = ""
//    var collectionView:UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedItem = sender as? String else{
            return
        }
        
        if segue.identifier == "addCell"
        {
            guard let destinationVC = segue.destination as? ViewController else{
                return
            }
            let indexPath = IndexPath(row: data.count - 1, section: 0)
            destinationVC.data.append(data)
            destinationVC.getData =  selectedItem


        }
        }
        @IBAction func addItem(_ sender: Any) {
            
            let text = addNewText.text ?? " "
            data.append(text)
           
            
          performSegue(withIdentifier: "addCell", sender: data)
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

