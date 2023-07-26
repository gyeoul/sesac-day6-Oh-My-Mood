//
//  EditViewController.swift
//  sesac-day6-hw
//
//  Created by 박창현 on 2023.07.25.
//

import UIKit

struct saveStruct:Codable {
    var score:[Int];
}
class EditViewController: UIViewController {
    enum Emotion:Int,CaseIterable {
        case VERY_GOOD,GOOD,SOSO,BAD,VERY_BAD
    }
    enum EditValue:Int,CaseIterable {
        case add1=1,add5=5,add10=10,reset=0
    }
    @IBOutlet var emontionButtons: [UIButton]! {
        didSet {
            emontionButtons.sort {
                $0.tag < $1.tag
            }
        }
    }
    var emotion:saveStruct = saveStruct(score: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        var action:[UIAction] = []
        for b in emontionButtons {
            action.append(UIAction(title: "+1", handler: { _ in self.changeValue(value: EditValue.add1,target: b.tag) }))
            action.append(UIAction(title: "+5", handler: { _ in self.changeValue(value: EditValue.add5,target: b.tag) }))
            action.append(UIAction(title: "+10", handler: { _ in self.changeValue(value: EditValue.add10,target: b.tag) }))
            action.append(UIAction(title: "리셋",attributes: .destructive, handler: { _ in self.changeValue(value: EditValue.reset,target: b.tag) }))
            b.menu = UIMenu(children: action)
        }
    }
    
    func changeValue(value:EditValue,target:Int) {
        //        let key = "Emotion\(target)"
        if value == .reset {
            //            UserDefaults.standard.set(0, forKey: key)
            emotion.score[target] = 0
            return
        }
        //        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: key)+value.rawValue,forKey: key)
        emotion.score[target] += value.rawValue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let encoder = JSONEncoder()
        if let saveData = try? encoder.encode(emotion) {
            UserDefaults.standard.set(saveData,forKey: "EmotionData")
        }
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let saveData = UserDefaults.standard.object(forKey: "EmotionData") as? Data {
            let decoder = JSONDecoder()
            if let decodeData = try? decoder.decode(saveStruct.self, from: saveData) {
                emotion = decodeData
            }
        } else {
            emotion = saveStruct(score: [0,0,0,0,0])
        }
    }
}
