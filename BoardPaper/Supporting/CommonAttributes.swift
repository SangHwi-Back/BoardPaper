//
//  CommonAttributes.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/03.
//

import Foundation
import UIKit
import CoreData

public weak var cdContainer: NSPersistentContainer? {
    
    get {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let container = appDelegate?.persistentContainer {
            return container
        } else {
            let container = NSPersistentContainer(name: "BoardPaper")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
                appDelegate?.persistentContainer = container
            })
            
            return container
        }
    }
}

public func saveContext() {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    if let _ = appDelegate?.persistentContainer {
        appDelegate?.saveContext()
    }
}

public var tagForSpinner = UUID().uuidString
public var tagForIndicator = UUID().uuidString

extension String {
}

