//
//  Alarm+CoreDataClass.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/07.
//
//

import Foundation
import CoreData

@objc(Alarm)
public class Alarm: NSManagedObject {
    
    public static let entityName = "Alarm"
    
    public static let keyContents = "contents"
    public static let keyIcon = "icon"
    public static let keyIsRoutine = "isRoutine"
    public static let keyPopDate = "popDate"
    public static let keyPrivateKey = "privateKey"
}
