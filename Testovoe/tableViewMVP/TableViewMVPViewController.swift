//
//  TableViewMVPViewController.swift
//  Testovoe
//
//  Created  Yaroslav on 24.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import Alamofire
import MBProgressHUD
import SDWebImage

// MARK: View -
protocol TableViewMVPViewProtocol: AnyObject {
    
    func reloadData()
    
    
}


class TableViewMVPViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: TableViewMVPPresenterProtocol = TableViewMVPPresenter()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Экран категорий"
        presenter.view = self
        presenter.viewDidLoad()
        
        tableView.register(UINib(nibName: "MyCell", bundle: Bundle.main), forCellReuseIdentifier: "MyCell")
    }
}

extension TableViewMVPViewController: TableViewMVPViewProtocol {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
}

extension TableViewMVPViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else {
            return UITableViewCell()
        }
        cell.update(with: presenter.category(for: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.numberOfCategories()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let jokeVC = StoryboardScene.JokeText.jokeTextViewController.instantiate()
            jokeVC.presenter.targetCategory(category: "Random")
            MBProgressHUD.showAdded(to: view, animated: true)
            navigationController?.pushViewController(jokeVC, animated: true)
            MBProgressHUD.hide(for: self.view, animated: true)
        } else {
            let jokeVC = StoryboardScene.JokeText.jokeTextViewController.instantiate()
            jokeVC.presenter.targetCategory(category: presenter.category(for: indexPath))
            MBProgressHUD.showAdded(to: view, animated: true)
            navigationController?.pushViewController(jokeVC, animated: true)
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}
struct Joke: Decodable {
    let value: String
    let icon_url: String
}
