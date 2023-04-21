//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 21.04.2023.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
    func fetchCharacters() {
        RMService.shared.execute(.listCharacterRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
                print(String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Неподдерживаемая ячейка")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(
            characterStatusName: "Evgeniy",
            characterStatus: .alive,
            characterImageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/20.jpeg")
        )
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
}

