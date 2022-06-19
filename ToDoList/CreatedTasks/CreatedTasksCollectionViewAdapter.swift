//
//  Adapter.swift
//  ToDoList
//
//  Created by maksim.surkov on 19.06.2022.
//

import Foundation
import UIKit

class CreatedTasksCollectionViewAdapter: NSObject {
    
    // MARK: - Nested Types

    typealias Cell = CreatedTaskCell
    
    // MARK: - Properties
    
    var onItemSelected: ((CreatedTaskModel) -> Void)?
    
    // MARK: - Private properties
    
    private weak var collectionView: UICollectionView?

    private(set) var items: [CreatedTaskModel] = []
    private var selectedId: Int?
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "CreatedTaskCell")
        collectionView.accessibilityIdentifier = "todoList.created_tasks_collection_view"
    }
    
    func configure(_ items: [CreatedTaskModel], selectedId: Int) {
        self.items = items
        self.selectedId = selectedId
        
        collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension CreatedTasksCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreatedTaskCell", for: indexPath) as? Cell
        else { return UICollectionViewCell() }
        let item = items[indexPath.row]
        let isSelected = selectedId == item.id
        cell.configure(model: item)
        cell.accessibilityIdentifier = "todoList.created_tasks_cell"
        cell.accessibilityTraits = isSelected ? .selected : .none
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension CreatedTasksCollectionViewAdapter: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        onItemSelected?(items[indexPath.row])
    }
}

// MARK: - UICollectionViewFlowLayout

extension CreatedTasksCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 100.0, height: 100.0)
    }
}
