//
//  CharacterCell.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/18.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    private let imageView = UIImageView()
    let label = UILabel()
    var imageUrl = "" {
        didSet {
            loadImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemnted")
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        label.text = ""
    }
}

extension CharacterCell {
    private func configure() {
        backgroundColor = UIColor(named: "CellBackGround")
        layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 140),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
        ])
    }
    
    private func loadImage() {
        ImageLoader.shared.loadImage(from: imageUrl) { result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async { [weak self] in
                    self?.imageView.image = success
                }
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
}
