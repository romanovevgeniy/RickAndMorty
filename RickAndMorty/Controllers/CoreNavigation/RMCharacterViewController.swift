//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 16.04.2023.
//

import UIKit

/// Controller to show and search for Characters
final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Персонажи"
        
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
 
