//
//  DisplayViewController.swift
//  sesac-day6-hw
//
//  Created by 박창현 on 2023.07.25.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet var viewList: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for v in viewList {
            v.layer.cornerRadius = 15
        }
        
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
