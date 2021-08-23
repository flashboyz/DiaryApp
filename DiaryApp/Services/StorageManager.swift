//
//  StorageManager.swift
//  DiaryApp
//
//  Created by Константин Прокофьев on 23.08.2021.
//

import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init(){}

    func save(taskList: [TaskList]) {
        try! realm.write {
            realm.add(taskList)
        }
    }
}
