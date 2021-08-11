//
//  LoginViewController.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/07/28.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInWithAppleTouchUpInside(_ sender: UIButton) {
        let mainNav = storyboard!.instantiateViewController(withIdentifier: "mainNavigationViewController")
        mainNav.modalTransitionStyle = .coverVertical
        mainNav.modalPresentationStyle = .fullScreen
        self.present(mainNav, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
