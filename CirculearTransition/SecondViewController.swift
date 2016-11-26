//
//  SecondViewController.swift
//  CirculearTransition
//
//  Created by 田山　由理 on 2016/11/25.
//  Copyright © 2016年 Yuri Tayama. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
    }
    
    @IBAction func dismissSecondVC(_ sender: AnyObject) {
    
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
