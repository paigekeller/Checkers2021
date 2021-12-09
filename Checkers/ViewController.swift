//
//  ViewController.swift
//  Checkers
//
//  Created by Paige Keller on 12/2/21.
//

class AppData{
    static var playerType = Int()
}

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func selectedSinglePlayer(_ sender: UIButton) {
        AppData.playerType = 0
        performSegue(withIdentifier: "toGame", sender: "home")
    }
    
    @IBAction func selectedTwoPlayerLocal(_ sender: UIButton) {
        AppData.playerType = 1
        performSegue(withIdentifier: "toGame", sender: "home")
    }
    
    @IBAction func selectedTwoPlayerOnline(_ sender: UIButton) {
        AppData.playerType = 2
        performSegue(withIdentifier: "toGame", sender: "home")
    }
    
    @IBAction func showPopUpButton(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RulePopUp") as! RulesPopUpViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue){
        AppData.playerType = Int()
    }
//    @IBAction func onePlayer(_ sender: UIButton) {
//        AppData.playerType = 1
//    }
//    
//    @IBAction func TwoPlayerLocal(_ sender: UIButton) {
//        AppData.playerType = 2
//    }
//    
//    @IBAction func TwoPlayerOnline(_ sender: UIButton) {
//        AppData.playerType = 3
//    }
    
}

