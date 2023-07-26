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
    var emotionData = saveStruct(score: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        for v in viewList {
            v.layer.cornerRadius = 15
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let saveData = UserDefaults.standard.object(forKey: "EmotionData") as? Data {
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode(saveStruct.self, from: saveData) {
                emotionData = decodeData
            }
        } else {
            emotionData = saveStruct(score: [0,0,0,0,0])
        }
        for i in 0...emotionData.score.count-1 {
            countList[i].text = "\(emotionData.score[i])회"
        }
    }
    
}
