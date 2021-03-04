//
//  ViewController.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 3.03.2021.
//

import UIKit
import SwiftIcons

class ViewController: UIViewController {

    @IBOutlet var loginClicked: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginClicked.setIcon(icon: .emoji(.balloon), title: "Welcome", color: .black, forState: .normal)
    }


}

