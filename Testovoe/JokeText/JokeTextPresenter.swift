//
//  JokeTextPresenter.swift
//  Testovoe
//
//  Created  Yaroslav on 31.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import Alamofire

// MARK: Presenter -
protocol JokeTextPresenterProtocol {
    var view: JokeTextViewProtocol? { get set }
    func viewDidLoad()
    func targetCategory(category: String)
}


class JokeTextPresenter: JokeTextPresenterProtocol {
  
    
    var view: JokeTextViewProtocol?
    
    func viewDidLoad() {
        
 
    }
    
    func targetCategory(category: String) {
        if category == "Random" {
            AF.request("https://api.chucknorris.io/jokes/random",
                       method: .get).responseDecodable(of: Joke.self) {response in
                let joke = response.value
                let iconUrl = joke?.icon_url
                let text = joke?.value
                self.view?.updateImage(urlImage: iconUrl ?? "")
                self.view?.updateLabel(jokeText: text ?? "")
              
                
            }
        } else {
            AF.request("https://api.chucknorris.io/jokes/random?category=\(category)",
                       method: .get).responseDecodable(of: Joke.self) {response in
                let joke = response.value
                let iconUrl = joke?.icon_url
                let text = joke?.value
                self.view?.updateImage(urlImage: iconUrl ?? "")
                self.view?.updateLabel(jokeText: text ?? "")
                
            }
        }
    }
}





