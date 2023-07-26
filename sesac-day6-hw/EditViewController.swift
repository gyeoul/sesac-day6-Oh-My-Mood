//
//  EditViewController.swift
//  sesac-day6-hw
//
//  Created by 박창현 on 2023.07.25.
//

import UIKit

class EditViewController: UIViewController {
    enum Emotion:Int,CaseIterable {
        case VERY_GOOD,GOOD,SOSO,BAD,VERY_BAD
    }
    enum EditValue:Int,CaseIterable {
        case add1=1,add5=5,add10=10,reset=0
    }
    struct saveStruct:Codable {
        var score:[Int]=[];
    }
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
            action.append(UIAction(title: "리셋",attributes: .destructive, handler: { _ in self.changeValue(value: EditValue.reset,target: b.tag) }))
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
    }
    func changeValue(value:EditValue,target:Int) {
        let key = "Emotion\(target)"
        if value == .reset {
            UserDefaults.standard.set(0, forKey: key)
            return
        }
        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: key)+value.rawValue,forKey: key)
    }
}
