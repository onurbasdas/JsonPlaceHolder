//
//  ProfilViewController.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 4.03.2021.
//

import UIKit
import SwiftIcons

class ProfilViewController: UIViewController {
    @IBOutlet var githubButton: UIButton!
    @IBOutlet var linkedinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func addLinkedinClicked(_ sender: Any) {
        openUrl(urlStr: "https://www.linkedin.com/")
    }
    
    @IBAction func addGithubClicked(_ sender: Any) {
        openUrl(urlStr: "https://github.com/")
    }
    func openUrl(urlStr: String!) {
        if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
}

