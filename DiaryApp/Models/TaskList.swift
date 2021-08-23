//
//  TaskList.swift
//  DiaryApp
//
//  Created by Константин Прокофьев on 23.08.2021.
//

import RealmSwift

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var date = Date()
    @objc dynamic var isComplete = false
}

class TaskList: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    let tasks = List<Task>()
}
