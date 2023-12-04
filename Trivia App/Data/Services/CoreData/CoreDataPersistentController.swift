//
//  CoreDataPersistent.swift
//  Trivia App
//
//  Created by user242582 on 4/12/23.
//

import Foundation
import CoreData

struct CoreDataPersistentController {
    let container: NSPersistentContainer
    
    init() {
        self.container = NSPersistentContainer(name: "Main")
        
        container.loadPersistentStores { description, error in
            
            let paths = NSSearchPathForDirectoriesInDomains(
                FileManager.SearchPathDirectory.documentDirectory,
                FileManager.SearchPathDomainMask.userDomainMask,
                true
            )
            
            print(paths)
            
            if let error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
}
