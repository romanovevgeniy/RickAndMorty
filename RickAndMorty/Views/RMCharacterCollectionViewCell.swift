//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Евгений Романов on 21.04.2023.
//

import UIKit

/// Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textColor = .secondaryLabel
        statusLabel.font = .systemFont(ofSize: 16, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.addSubViews(imageView, nameLabel, statusLabel)
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Не поддерживается")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterStatusName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage(completion: { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        })
    }
    
}
