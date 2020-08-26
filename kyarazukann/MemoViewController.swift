//
//  MemoViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/19.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var table: UITableView!
    
//    var titleDeta: [String] = []
    var number:Int! = nil
    var saveDeta: UserDefaults = UserDefaults.standard
    var titleArray: Array = [String]()
    var array: [String] = []
    
    //KyarazukannViewControllerから受け取った値を入れるための変数。
    var recievedContentNumber: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        //titlededaのtiindexpathを表示する
    // = saveDeta.object(forKey: "store") as! [String]
        //ここが分からないです分からないです↑
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        
        //print(recievedContentNumber!)
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        if number == nil {
            
        } else {
           
        //    titleDeta = saveDeta.object(forKey: "memo") as! [String]
         //   print(titleDeta[number])
         //   titleTextField.text = titleDeta[number]
          
           print(array[number])
          //わからん
            
        }
        
        
        print(titleArray)
        
        table.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return titleArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = String(titleArray[indexPath.row])
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "toNextViewController", sender: nil)
    }
    
    
    
    
    
}

