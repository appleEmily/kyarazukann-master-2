//
//  MemoSetViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/27.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class MemoSetViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var titleTextField: UITextField!
    
    var contentsArray: [String] = []
    var number:Int! = nil
    var saveDeta: UserDefaults = UserDefaults.standard
    var array: [String] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.register(defaults:["memo":contentsArray])
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if saveDeta == nil {
            
        } else {
            number = (saveDeta.object(forKey: "memo") as! [String]).count
            print(number)
        }
        
        
        if number == nil {
            
        } else {
            
            contentsArray = saveDeta.object(forKey: "memo") as! [String]
            print(contentsArray)
            //   print(contentsArray[number])
            number = (saveDeta.object(forKey: "memo") as! [String]).count
            print(number)
            
            //   titleTextField.text = contentsArray[number]
        }
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo() {
        
        
        print(contentsArray)
        contentsArray.append(titleTextField.text!)
        print(contentsArray)
        
        saveDeta.set(contentsArray, forKey: "memo")
        
        print(UserDefaults.standard.object(forKey: "memo"))
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    
                    self.navigationController?.popViewController(animated: true)
            }
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    func textFieldReturn(_ textFiled: UITextField) -> Bool {
        textFiled.resignFirstResponder()
        return true
    }
    
}
