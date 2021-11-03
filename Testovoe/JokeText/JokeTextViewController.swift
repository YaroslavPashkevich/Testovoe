//
//  JokeTextViewController.swift
//  Testovoe
//
//  Created  Yaroslav on 31.10.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
import MBProgressHUD
import Alamofire
import SDWebImage

// MARK: View -
protocol JokeTextViewProtocol: AnyObject {
    
    func updateImage(urlImage: String)
    func updateLabel(jokeText: String)
    
    
}

class JokeTextViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var jokeLabel: UILabel!
    
    
    var presenter: JokeTextPresenterProtocol = JokeTextPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.view = self
        presenter.viewDidLoad()
    }
}

extension JokeTextViewController: JokeTextViewProtocol {
    func updateLabel(jokeText: String) {
        jokeLabel.text = jokeText
    }
    
    func updateImage(urlImage: String) {
        imageView.sd_setImage(with: URL(string: urlImage))
        
    }
    
   
    
}
