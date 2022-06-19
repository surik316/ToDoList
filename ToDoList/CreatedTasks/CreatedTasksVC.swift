//
//  CreatedTasksVC.swift
//  ToDoList
//
//  Created by maksim.surkov on 19.06.2022.
//

import Foundation
import UIKit

class CreatedTaskViewController: UIViewController {
    
    // MARK: - Computed Properties
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    private lazy var adapter: CreatedTasksCollectionViewAdapter = {
        let adapter = CreatedTasksCollectionViewAdapter(collectionView)
        return adapter
    }()
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
        configure(adapter: adapter)
    }
    
    private func configure(adapter: CreatedTasksCollectionViewAdapter) {
        adapter.onItemSelected = { [weak self] model in
            
        }
        
        adapter.configure(fethcData(), selectedId: 0)
    }
    
    // MARK: - Public methods
    
    func fethcData() -> [CreatedTaskModel] {
        return [
            .init(id: 0, previewText: "ljkasdfasdf", theme: "SOME"),
            .init(id: 1, previewText: "asldkfjal;sdjflkasdjfkasjdf;asdjfk", theme: "NEW", marker: .yellow)
        ]
    }
}
