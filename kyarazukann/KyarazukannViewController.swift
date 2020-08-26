//
//  KarazukannViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/04.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class KyarazukannViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
//    var saveData: UserDefaults = UserDefaults.standard
    var number: Int! = nil
    
    var contentNumber: Int! = nil

    var titleDeta: [String] = []
    var saveDeta: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.register(defaults: ["title":titleDeta])
       // userDefaults.register(defaults: ["title": titleDeta]
      // ここをどーにかする!
   
       
        // Do any additional setup after loading the view.
     //   titleDeta = saveDeta.object(forKey: "title") as! [String]
        table.dataSource = self
        table.delegate = self
        
        table.reloadData()
        
    }
    
  override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
    //if saveDeta == nil {
                      
               //} else {
                   number = (saveDeta.object(forKey: "title") as! [String]).count
                  //}


        if number == nil {
            
        } else {
            //print(number!)
            titleDeta = saveDeta.object(forKey: "title") as! [String]
            //問題あり
            print(titleDeta[number - 1])
                      
        
        }
        //print(titleDeta)
        
    table.reloadData()
    }
 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleDeta.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = String(titleDeta[indexPath.row])
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //contentNumberというInt型の変数を上の方で宣言してあげます。
        //このcontentNumberに、タップされたcellが何行めなのか、という情報を入れておいてあげて、この変数を下の方に書いたメソッドでmemoViewControllerに引き渡すよ！
        contentNumber = indexPath.row
        performSegue(withIdentifier: "MemoViewController", sender: nil)

    }
    
    //値を引き渡すためのメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemoViewController" {
            let vc = segue.destination as! MemoViewController
            vc.recievedContentNumber = self.contentNumber
            
        }
    }

    
}
