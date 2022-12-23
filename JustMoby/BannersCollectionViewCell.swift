//
//  BannersCollectionViewCell.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 22.12.2022.
//

import UIKit

class BannersCollectionCell: UICollectionViewCell {
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gradient")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.sizeToFit()
        label.text = "Try three days free trial"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "You will get all outfit templates, special textures and details"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var photoImage: UIImageView = {
        let photoImage = UIImageView()
        photoImage.image = UIImage(named: "coffeeCup")
        photoImage.clipsToBounds = true
        photoImage.contentMode = .scaleAspectFit
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundConstraints()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        self.contentView.addSubview(self.horizontalStackView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(photoImage)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        let topConstraint = self.horizontalStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let centerY = self.horizontalStackView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let left = self.horizontalStackView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 8)
        let right = self.horizontalStackView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    centerY,
                                    left,
                                    right
                                    ])
    }
    
    private func setupBackgroundConstraints(){
        self.contentView.addSubview(self.backgroundImage)
        
        let topConstraint = self.backgroundImage.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let centerY = self.backgroundImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let left = self.backgroundImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
        let right = self.backgroundImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    centerY,
                                    left,
                                    right
                                    ])
    }
    
}

