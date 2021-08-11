//
//  Alarm+CoreDataProperties.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/07.
//
//

import Foundation
import CoreData


extension Alarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alarm> {
        return NSFetchRequest<Alarm>(entityName: "Alarm")
    }

    @NSManaged public var contents: String?
    @NSManaged public var icon: String?
    @NSManaged public var isRoutine: Bool
    @NSManaged public var popDate: Date?
    @NSManaged public var privateKey: UUID?

}

extension Alarm : Identifiable {

}
