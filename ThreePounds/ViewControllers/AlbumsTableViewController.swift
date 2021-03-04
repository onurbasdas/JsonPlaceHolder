//
//  AlbumsTableViewController.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 4.03.2021.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    var albumData = [Album]()
    var page = 0
    
    var loadingData = false
    var allDataLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAlbums(page)
        
        
    }
    
    func getAlbums(_ page: Int){
        Api.shared.getAlbumList(page: page){
            albums in
            if albums?.count == 0 {
                return
            }
            self.page += 1
            for album in albums! {
                self.albumData.append(album)
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumsTableViewCell
        
        if let title =  self.albumData[indexPath.row].title {
            cell.labelTitle.text = title
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
       
    }

}
