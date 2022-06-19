//
//  CreatedTaskModel.swift
//  ToDoList
//
//  Created by maksim.surkov on 19.06.2022.
//

import Foundation

enum TaskMarker {
    case red
    case green
    case blue
    case yellow
}

struct CreatedTaskModel {
    var id: Int
    var previewText: String
    var theme: String
    var marker: TaskMarker?
}
