//
//  SegmentedViewController.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 4.03.2021.
//

import UIKit

class SegmentedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var imageView: UIImageView!
    
    var commentData = [Comment]()
    var photoData = [Photo]()
    
    let photoList : [String] = ["photo", "sdnfjndsl"]
    var albumId: Int!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
        
        downloadJSON {
            self.myTableView.reloadData()
        }
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        
    }
    
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.commentData = try JSONDecoder().decode([Comment].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                }catch{
                    print("Error")
                }
                
            }
        }.resume()
    }
    
    
    
    
    @IBAction func segmentedControl(_ sender: UISegmentedControl) {
        myTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = 0
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            value = photoList.count
            break
        case 1:
            value = commentData.count
            break
        default:
            break
        }
        
        
        return value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        switch(segmentedControl.selectedSegmentIndex){
        case 0:
            cell.textLabel?.text = photoList[indexPath.row]
            break
        case 1:
            cell.textLabel?.text = commentData[indexPath.row].body
            break
        default:
            break
        }
        
        return cell
    }
    
}
