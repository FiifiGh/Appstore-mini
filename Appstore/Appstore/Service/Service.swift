//
//  Service.swift
//  Appstore Mini
//
//  Created by FiiFi Acquaah on 7/30/23.
//

import Foundation

class Service {
    
    
    static let shared = Service()
    
    private init(){}
    
    func fetchAppSearch(searchItem: String = "",completed: @escaping ([Result]?,Error?)->Void){
    
        let urlString = "https://itunes.apple.com/search?term=\(searchItem)&entity=software"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error = error {
                completed(nil, error)
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let searchResult = try decoder.decode(SearchResult.self, from: data)
                    completed(searchResult.results, nil)
                }catch {
                    completed(nil, error)
                }
            }
        }.resume()
    }
    
    func fetchFreeApps(completed: @escaping (AppGroup?, Error?)->Void){
        fetchAppGroup(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json", completed: completed)
    }
           
    func fetchPaidApps(completed: @escaping (AppGroup?, Error?)->Void){
        fetchAppGroup(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json", completed: completed)
    }
    
    func fetchSocialApps(completed: @escaping([SocialApp]?, Error?)->Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completed(nil, error)
            }
            
            do {
                guard let data = data else {
                    completed(nil, error)
                    return
                }
                let jsonData = try JSONDecoder().decode([SocialApp].self, from: data)
                completed(jsonData, nil)
                
            }catch{
                completed(nil, error)
            }
            
            
            
            
        }.resume()
    }
    
    fileprivate  func fetchAppGroup(urlString: String, completed: @escaping (AppGroup?, Error?)->Void){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completed(nil, error)
            }
            
            do {
                guard let data = data else {
                    completed(nil, error)
                    return
                }
                let jsonData = try JSONDecoder().decode(AppGroup.self, from: data)
                completed(jsonData, nil)
                
            }catch{
                completed(nil, error)
            }
            
            
            
            
        }.resume()
    }
}
