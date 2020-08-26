//
//  NoteViewController.swift
//  kyarazukann
//
//  Created by 柳和花 on 2020/06/27.
//  Copyright © 2020 柳和花. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    //     Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
       tableView.deselectRow(at: indexPath, animated: true)
     
        
        performSegue(withIdentifier: "toNextViewController", sender: nil)
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
