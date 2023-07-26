//
//  TutorialViewModel.swift
//  Poker Tutorials and Practice Exercises
//
//  Created by Mac on 07/06/2023.
//

import Foundation
import UIKit
protocol PassDataDelegate:NSObject {
    func passData(pokerResponse:PokerResponse,id:String)
}

protocol InfoLoader {
    func loadGeneralInfo(key:String,id:String , completion:@escaping(Result<PokerResponse,Error>)->(Void))
}

class RemoteInfoLoader:InfoLoader {
    func loadGeneralInfo(key: String, id: String, completion: @escaping (Result<PokerResponse, Error>) -> (Void)) {
        ApiClient.shared.loadGeneralInfo(about: key) {  result in
            completion(result)
        }
    }
}
class LocalInfoLoader:InfoLoader {
    func loadGeneralInfo(key: String, id: String, completion: @escaping (Result<PokerResponse, Error>) -> (Void)) {
        
    }
}


class RemoteAndLocalInfoLoaderService:InfoLoader {
    var remoteInfoLoader:RemoteInfoLoader?
    var localInfoLoader:LocalInfoLoader?
    
    init(remoteInfoLoader: RemoteInfoLoader? = nil, localInfoLoader: LocalInfoLoader? = nil) {
        self.remoteInfoLoader = remoteInfoLoader
        self.localInfoLoader = localInfoLoader
    }
    
    func loadGeneralInfo(key: String, id: String, completion: @escaping (Result<PokerResponse, Error>) -> (Void)) {
        let load: InfoLoader = Reachability.isNetworkReachable ? self.remoteInfoLoader! : self.localInfoLoader!
        load.loadGeneralInfo(key: key, id: id,completion: completion)
    }
}

class GeneralInfoViewModel {
    var infoLoader:RemoteAndLocalInfoLoaderService?
    var passDataDelegate:PassDataDelegate?
    
    convenience init(infoLoader:RemoteAndLocalInfoLoaderService) {
        self.init()
        self.infoLoader = infoLoader
    }
    
    func loadGeneralInfo(key:String,id:String) {
        
        //if we have  internet Reachability
        infoLoader?.loadGeneralInfo(key: key, id: id) { [weak self] result in
            switch result {
            case .success(let pokerResponse):
                DispatchQueue.main.async {
                    self?.passDataDelegate?.passData(pokerResponse: pokerResponse, id: id)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
