//
//  ViewController.swift
//  CirculearTransition
//
//  Created by 田山　由理 on 2016/11/25.
//  Copyright © 2016年 Yuri Tayama. All rights reserved.
//

import UIKit

//UIViewControllerTransitioningDelegate:遷移元のVCで採用し、遷移時のアニメーションコントローラを指定する。
class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuButton: UIButton!
    
    let transition = CircularTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
    }
    
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
        
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circlarColor =  menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circlarColor =  menuButton.backgroundColor!
        
        return transition
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

