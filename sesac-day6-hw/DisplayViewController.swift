//
//  DisplayViewController.swift
//  sesac-day6-hw
//
//  Created by 박창현 on 2023.07.25.
//

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet var viewList: [UIView]!
    @IBOutlet var countList: [UILabel]! {
        didSet {
            countList.sort {
                $0.tag < $1.tag
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for v in viewList {
            v.layer.cornerRadius = 15
            for i in 0...countList.count-1 {
                countList[i].text = "\(UserDefaults.standard.integer(forKey: "Emotion\(i)"))회"
            }
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
