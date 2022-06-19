//
//  CreatedTaskCell.swift
//  ToDoList
//
//  Created by maksim.surkov on 19.06.2022.
//

import Foundation
import UIKit

class CreatedTaskCell: UICollectionViewCell {
    
    // MARK: - Computed Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var markImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // MARK: - init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        contentView.backgroundColor = .yellow
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])
        
        contentView.addSubview(subTitleLabel)
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            subTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            subTitleLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 5)
        ])
        
        contentView.addSubview(markImageView)
        NSLayoutConstraint.activate([
            markImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            markImageView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            markImageView.widthAnchor.constraint(equalToConstant: 25),
            markImageView.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
    // MARK: - Public methods
    
    func configure(model: CreatedTaskModel) {
        titleLabel.text = model.theme
        subTitleLabel.text = model.previewText
        guard let marker = model.marker else { return }
        switch marker {
        case .red:
            markImageView.image = UIImage()
        case .green:
            markImageView.image = UIImage()
        case .blue:
            markImageView.image = UIImage()
        case .yellow:
            markImageView.image = UIImage()
        }
    }
}
