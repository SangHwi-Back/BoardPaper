//
//  MainMenu+CoreDataClass.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/07.
//
//

import Foundation
import CoreData

@objc(MainMenu)
public class MainMenu: NSManagedObject {
    public static var entityName = "MainMenu"
    
    public static var defaultMenuNames = ["오늘할일","중요","계획된일정","모두","나에게할당됨","작업"]
    
    /// String
    public static let keyDestinationIdentifier = "destination_identifier"
    /// String
    public static let keyIconName = "icon_name"
    /// UUID
    public static let keyMainMenuKey = "main_menu_key"
    /// String
    public static let keyMenuKind = "menu_kind"
    /// String
    public static let keyMenuName = "menu_name"
    /// NSNumber
    public static let keyOrder = "order"
    
    static func getMenuKind(menuName: String) -> MainMenuType? {
        switch menuName.trimmingCharacters(in: .whitespaces) {
        case defaultMenuNames[0]:
            return MainMenuType.today
        case defaultMenuNames[1]:
            return MainMenuType.important
        case defaultMenuNames[2]:
            return MainMenuType.scheduled
        case defaultMenuNames[3]:
            return MainMenuType.all
        case defaultMenuNames[4]:
            return MainMenuType.presented
        case defaultMenuNames[5]:
            return MainMenuType.workspace
        default:
            return nil
        }
    }
    
    static func getDestination(type: MainMenuType) -> String {
        switch type {
        case .today:
            return "BoardListViewController"
        case .important:
            return "BoardListViewController"
        case .scheduled:
            return "BoardListViewController"
        case .all:
            return "BoardListViewController"
        case .presented:
            return "BoardListViewController"
        case .workspace:
            return "BoardListViewController"
        }
    }
}

enum MainMenuType: Equatable {
    case today
    case important
    case scheduled
    case all
    case presented
    case workspace
}
