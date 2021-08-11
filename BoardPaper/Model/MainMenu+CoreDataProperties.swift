//
//  MainMenu+CoreDataProperties.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/07.
//
//

import Foundation
import CoreData


extension MainMenu {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MainMenu> {
        return NSFetchRequest<MainMenu>(entityName: "MainMenu")
    }

    @NSManaged public var destination_identifier: String?
    @NSManaged public var icon_name: String?
    @NSManaged public var main_menu_key: UUID?
    @NSManaged public var menu_kind: String?
    @NSManaged public var menu_name: String?
    @NSManaged public var order: Int64

}

extension MainMenu : Identifiable {

}
