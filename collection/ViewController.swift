//
//  ViewController.swift
//  collection
//
//  Created by Lisette Antigua on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addCategory: UITextField!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var getData:String?
    
    
    @IBOutlet weak var createCell: UIView!
    var data = ["Computer Science", "Math", "Forensic Science"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        let numOfColumn = 1
        let width = (Int(self.view.frame.size.width) - (numOfColumn - 1) * 10) / numOfColumn
        let layout =  collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        createCell.isHidden = true
        
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedItem = sender as? String else{
            return
        }
        if segue.identifier == "detail"
        {
            guard let destinationVC = segue.destination as? DetailViewController else{
                return
            }
            destinationVC.selectedData =  selectedItem
        }
        
        
    }
    
    
   
    @IBAction func add(_ sender: Any) {
        
        createCell.isHidden = false
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView( _ collectionView:UICollectionView, numberOfItemsInSection section:Int ) -> Int
    {
        return data.count
    }
    
    
    func collectionView( _ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        if let label = cell.viewWithTag(100) as? UILabel{
//            label.text =  data[indexPath.item]
//
//        }
        cell.itemLabel.text = data[indexPath.item]
        return cell
    }
    
    @IBAction func addItem(_ sender: Any) {
        createCell.isHidden = false
        guard let text = addCategory.text else { return   }
        if addCategory.text != ""
        {
            
            data.append(text)
            let indexPath = IndexPath(row: data.count - 1, section: 0)
            collectionView.insertItems(at: [indexPath])
            addCategory.text = ""
            
        }
        else{
            return
        }
        
       
         createCell.isHidden = true
        
}
    
    //cell selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectData = data[indexPath.item]
        self.performSegue(withIdentifier: "detail", sender: selectData)
    }
}
