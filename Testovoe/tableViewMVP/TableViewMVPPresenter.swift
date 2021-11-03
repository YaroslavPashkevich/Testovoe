//
//  TableViewMVPPresenter.swift
//  Testovoe
//
//  Created  Yaroslav on 24.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import Alamofire
import UIKit

// MARK: Presenter -
protocol TableViewMVPPresenterProtocol {
    var view: TableViewMVPViewProtocol? { get set }
    func viewDidLoad()
    
    func category(for indexPath: IndexPath) -> String
    func numberOfCategories() -> Int
    
}

class TableViewMVPPresenter: TableViewMVPPresenterProtocol {
    
    weak var view: TableViewMVPViewProtocol?
    
    private var jokes: [Note] = []
    
    func category(for indexPath: IndexPath) -> String {
        return jokes[indexPath.row].jokes
    }
    func numberOfCategories() -> Int {
        return jokes.count
    }
    
    
    func addJoke() {
    
        AF.request("https://api.chucknorris.io/jokes/categories",
                   method: .get).responseDecodable(of: [String].self) {response in
            guard var joke = response.value else {return}
            joke.insert("Random", at: 0)
            for value in joke {
                DatabaseService.shared.insertEntityFor(
                    type: Note.self,
                    context: DatabaseService.shared.persistentContainer.mainContext,
                    closure: { note in
                        note.jokes = value
                        self.jokes.append(note)
                        DatabaseService.shared.saveMain(nil)
                        self.view?.reloadData()
                    }
                )
            }
        }       
    }
    
    func viewDidLoad() {
        
        
        addJoke()

            }
        }
  


