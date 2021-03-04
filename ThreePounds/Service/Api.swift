//
//  Api.swift
//  ThreePounds
//
//  Created by Onur Başdaş on 4.03.2021.
//

import Foundation
import Alamofire

class Api {
    
    static let shared = Api()
    
    fileprivate func request(method: Alamofire.HTTPMethod, uri: String, parameters: [String : Any]? = nil) -> DataRequest {
        
        let url = URL(string: AppConstants.mainUrl + uri)!
        let request = AF.request(url, method: method, parameters: parameters)
        
        request.responseData { dataResponse in
           
        }
        return request
    }
    
    fileprivate func get(_ uri: String,parameters: [String: Any]? = nil) -> DataRequest {
        return request(method: .get, uri: uri, parameters: parameters)
    }
    
    
  
    fileprivate func post(_ uri: String,
                          parameters: [String: Any]? = nil) -> DataRequest {
        return request(method: .post, uri: uri, parameters: parameters)
    }
    
    func getAlbumList(page: Int, _ completionHandler: @escaping ([Album]?) -> Void){
        
        let parameters = ["_limit": 100,
                          "_page": page]
        
        let req = get("/albums",parameters: parameters)
        
        req.responseJSON { response in
            
            guard let json = response.data else {
                completionHandler(nil)
                return
            }
            do{
                let decoder = JSONDecoder()
                let albums = try decoder.decode([Album].self, from: json)
                completionHandler(albums)
            }catch let err{
                print(err)
            }
        }
    }
    
    func getPhotoList(albumId: Int ,page: Int, _ completionHandler: @escaping ([Photo]?) -> Void){
        
        let parameters = ["_limit": 15,
                          "_page": page]
        
        let req = get("/albums/\(albumId)/photos",parameters: parameters)
        
        req.responseJSON { response in
            
            guard let json = response.data else {
                completionHandler(nil)
                return
            }
            do{
                let decoder = JSONDecoder()
                let photos = try decoder.decode([Photo].self, from: json)
                completionHandler(photos)
            }catch let err{
                print(err)
            }
        }
        
        
    }
    

}
    
