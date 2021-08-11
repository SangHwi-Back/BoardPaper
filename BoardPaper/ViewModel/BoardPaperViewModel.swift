//
//  BoardPaperViewModel.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/06.
//

import Foundation
import CoreData
import UIKit

class BoardPaperViewModel {
    
    var container: NSPersistentContainer!
    
    init() {
        container = cdContainer
        if container == nil {
            UIControl()
                .sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        }
    }
    
    func checkDefaultMenuExist(completionHandler: ([MainMenu]) -> Void) {
        
        do {
            let menus = try container.viewContext.fetch(MainMenu.fetchRequest()) as [MainMenu]
            let menuNames = menus.filter({ $0.menu_name != nil }).map({ $0.menu_name! })
            let noneMainMenus = MainMenu.defaultMenuNames.filter({menuNames.contains($0) == false})
            
            if noneMainMenus.isEmpty == false {
                setDefaultMainMenu(menuNames: noneMainMenus) { menus in
                    completionHandler(menus)
                }
            } else {
                completionHandler(menus)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setDefaultMainMenu(menuNames: [String], completionHandler: (([MainMenu]) -> Void)) {
        
        var menus = [MainMenu]()
        
        if let container = cdContainer, let entity = NSEntityDescription.entity(forEntityName: MainMenu.entityName, in: container.viewContext) {
            
            for (i, name) in menuNames.enumerated() {
                let mainMenu = NSManagedObject(entity: entity, insertInto: container.viewContext)
                
                mainMenu.setValue(nil, forKey: MainMenu.keyDestinationIdentifier)
                mainMenu.setValue("name\(i)", forKey: MainMenu.keyIconName)
                mainMenu.setValue(UUID(), forKey: MainMenu.keyMainMenuKey)
                mainMenu.setValue(name, forKey: MainMenu.keyMenuKind)
                mainMenu.setValue(name, forKey: MainMenu.keyMenuName)
                mainMenu.setValue(i, forKey: MainMenu.keyOrder)
            }
            
            saveContext()
            
            do {
                menus = try container.viewContext.fetch(MainMenu.fetchRequest()) as [MainMenu]
            } catch {
                print(error.localizedDescription)
            }
        }
        
        completionHandler(menus)
    }
    
    func saveAlarm(alarm_param: Alarm) -> Bool {
        
        guard alarm_param.privateKey != nil else {
            return false
        }
        
        if let container = cdContainer, let entity = NSEntityDescription.entity(forEntityName: Alarm.entityName, in: container.viewContext) {
            
            let alarm = NSManagedObject(entity: entity, insertInto: container.viewContext)
            
            alarm.setValue(alarm_param.contents, forKey: Alarm.keyContents)
            alarm.setValue(alarm_param.icon, forKey: Alarm.keyIcon)
            alarm.setValue(alarm_param.isRoutine, forKey: Alarm.keyIsRoutine)
            alarm.setValue(alarm_param.popDate, forKey: Alarm.keyPopDate)
            alarm.setValue(alarm_param.privateKey, forKey: Alarm.keyPrivateKey)
            
            do {
                try container.viewContext.save()
            } catch {
                print(error.localizedDescription)
                return false
            }
            
        }
        
        return true
    }
}
