//
//  EditViewController.swift
//  sesac-day6-hw
//
//  Created by 박창현 on 2023.07.25.
//

import UIKit

class EditViewController: UIViewController {
    enum Emotion:Int,CaseIterable {
        case verygood,good,soso,bad,verybad
    }
    enum EditValue:Int,CaseIterable {
        case add1=1,add5=5,add10=10,reset=0
    }
    struct saveStruct:Codable {
        var score:[Int]=[];
    }
    var score:[Int] = [0,0,0,0,0]
    @IBOutlet var emontionButtons: [UIButton]! {
        didSet {
            emontionButtons.sort {
                $0.tag < $1.tag
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var action:[UIAction] = []
        for b in emontionButtons {
            action.removeAll()
            action.append(UIAction(title: "+1", handler: { _ in self.changeValue(value: EditValue.add1,target: b.tag) }))
            action.append(UIAction(title: "+5", handler: { _ in self.changeValue(value: EditValue.add5,target: b.tag) }))
            action.append(UIAction(title: "+10", handler: { _ in self.changeValue(value: EditValue.add10,target: b.tag) }))
            action.append(UIAction(title: "리셋", handler: { _ in self.changeValue(value: EditValue.reset,target: b.tag) }))
            if let title = Emotion(rawValue: b.tag) {
                b.menu = UIMenu(title: "\(title)", children: action)
            }
        }
    }
    
    @IBAction func touchButton(_ sender: UIButton) {
//
//        print(Emotion(sender.tag))
        guard let now = Emotion(rawValue: sender.tag) else {
            return
        }
        print(now)
        score[sender.tag]+=1
        print(score)
    }
    func changeValue(value:EditValue,target:Int) {
        if value == .reset {
            score[target] = 0
            print(score)
            return
        }
        score[target] += value.rawValue
        print(score)
    }
}
