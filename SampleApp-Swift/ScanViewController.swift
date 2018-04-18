//
//  ScanViewController.swift
//  Bell
//
//  Created by Neha Magan Pal Singh on 17/08/2017.
//  Copyright © 2017 Punskyy, Roman. All rights reserved.
//

import UIKit
var details = ""
var raju = ""
class ScanViewController: UIViewController {

    @IBAction func ok(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "pay")
        self.navigationController?.popViewController(animated: true)
        
        
        
        
    }
    
   
    @IBOutlet var cards: UILabel!
    
    @IBOutlet weak var card2: UILabel!
    
    @IBOutlet weak var mybutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedValue = UserDefaults.standard.string(forKey: "Details") {
            
            self.cards.text = savedValue
        }
        else if let savedValues = UserDefaults.standard.string(forKey: "Raju") {
            
            self.card2.text = savedValues
        }
        
        mybutton.layer.cornerRadius = 5
        mybutton.layer.borderWidth = 1
        mybutton.layer.borderColor = UIColor.lightGray.cgColor
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
