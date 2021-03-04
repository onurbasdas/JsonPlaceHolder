//
//  SegeViewController.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 4.03.2021.
//

import UIKit

class SegeViewController: UIViewController {
    
    
    @IBOutlet var photoLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        photoLabel.center.x = view.center.x - 90
        photoLabel.center.x -= view.bounds.width
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            self.photoLabel.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
}
