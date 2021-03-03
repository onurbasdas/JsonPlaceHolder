//
//  AlbumViewController.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 3.03.2021.
//

import UIKit

class AlbumViewController: UIViewController {
    @IBOutlet var albumTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

struct Result : Codable {
    let name : String
    let status : String
    let gender : String
    let image : String
    let species : String
}
