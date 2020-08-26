//
//  TitleSetViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/27.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class TitleSetViewController: UIViewController, UITextFieldDelegate {
    
    //    override func viewDidLoad() {
    //      super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    // }
    
    @IBOutlet var titleTextField: UITextField!
    
    var titleDeta: [String] = []
    var number:Int! = 0
    var saveDeta: UserDefaults = UserDefaults.standard
    var storeArray: [[String]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
        
        UserDefaults.standard.register(defaults: ["title":titleDeta])
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        

 //       number = (saveDeta.object(forKey: "title") as! [String]).count
 //       print(number)
        
        
        if saveDeta == nil {
            
        } else {
            number = (saveDeta.object(forKey: "title") as! [String]).count
            print(number)
        }
        
        
        if number == 0 {
            
        } else {
            titleDeta = saveDeta.object(forKey: "title") as! [String]
            print(titleDeta)
            number = (saveDeta.object(forKey: "title") as! [String]).count
            print(number)
          //  print(titleDeta[number])
        }
        titleTextField.delegate = self
        print(titleDeta)
    }
    
    @IBAction func saveMemo() {
        
        let array: [String] = []
        print(storeArray)
        storeArray.append(array)
        //storeArray.set()
        saveDeta.set(storeArray, forKey: "store")
     //   print(saveDeta.object(forKey: "store") as! [String])
        //print(titleDeta)
        titleDeta.append(titleTextField.text!)
        print(titleDeta)
        //print(titleDeta)
        
        saveDeta.set(titleDeta, forKey: "title")
        print(saveDeta.object(forKey: "title") as! [String])
        
        //print(UserDefaults.standard.object(forKey: "title"))
        
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
