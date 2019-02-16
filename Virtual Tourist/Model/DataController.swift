//
//  DataCoreController.swift
//  Virtual Tourist
//
//  Created by Hessa Mohamed on 26/01/2019.
//  Copyright © 2019 Hessa Mohamed. All rights reserved.
//

import Foundation
import CoreData

class DataController {
   
    static let shared = DataController()
    
    private let persistentContainer:NSPersistentContainer
    
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Virtual_Tourist")
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
           // self.autoSaveViewContext()
            completion?()
        }
    }
    
/*    private func autoSaveViewContext(interval:TimeInterval = 30) {
        let timeInterval = interval > 0 ? interval : 30
        if interval <= 0 {
            // just informing the developer that something wrong has happened
            print("time interval should be greater than 0, will use the default time interval")
        }
        
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
            self.autoSaveViewContext(interval: timeInterval)
        }
    }*/
    
}
