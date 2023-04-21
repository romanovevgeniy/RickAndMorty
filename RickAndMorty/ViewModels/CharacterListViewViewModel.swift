//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 21.04.2023.
//

import Foundation

struct CharacterListViewViewModel {
    func fetchCaharcters() {
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


