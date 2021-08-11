//
//  MainViewController.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/07/28.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    private var mainViewModel: BoardPaperViewModel!
    
    var subMenuCount = 0
    var mainMenuCount = 0
    var mainMenuArray = [MainMenu]() {
        didSet {
            DispatchQueue.main.async {
                self.mainMenuCount = self.mainMenuArray.count
                self.mainMenuArray.sort { $0.order < $1.order }
                self.menuTableView.reloadData()
            }
        }
    }
    var submenuArray = [SubMenu]() {
        didSet {
            
        }
    }
    var logoImageArray = [UUID: UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainViewModel = BoardPaperViewModel()
        mainViewModel.checkDefaultMenuExist() { menus in
            self.mainMenuArray = menus
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? BoardListViewController, let cell = sender as? MainMenuTableViewCell {
            dest.param = cell.data
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MainMenuTableViewCell {
            performSegue(withIdentifier: BoardListViewController.description(), sender: cell)
        } else if let cell = tableView.cellForRow(at: indexPath) as? MainMenuCategoryTableViewCell {
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return mainMenuArray.count
        } else {
            return submenuArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = getTableViewCell(indexPath: indexPath)
        
        if let mainMenuCell = cell as? MainMenuTableViewCell {
            
            mainMenuCell.data = mainMenuArray[indexPath.row]
            mainMenuCell.menuTitleLabel.text = mainMenuCell.data?.menu_name
            DispatchQueue.global().async {
                if let key = mainMenuCell.data!.main_menu_key,
                   let image = self.logoImageArray[key] {
                    DispatchQueue.main.async {
                        mainMenuCell.logoImageView.image = image
                    }
                }
            }
        }
        
        return cell
    }
    
    private func getTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        
        var identifier = ""
        
        if indexPath.section == 0 {
            identifier = "MainMenuTableViewCell"
        } else {
            identifier = "MainMenuCategoryTableViewCell"
        }
        
        if let cell = menuTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? MainMenuTableViewCell {
            return cell
        }
        
        return menuTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}
