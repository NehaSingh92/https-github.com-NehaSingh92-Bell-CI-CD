//
//  BillViewController.swift
//  Bell
//
//  Created by Neha Magan Pal Singh on 17/08/2017.
//  Copyright © 2017 Punskyy, Roman. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {

    @IBOutlet var EPhoneNo1: UIButton!
    
    @IBAction func PayNow(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "pay")
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func EPhone(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Ephone")
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func EPhoneNo(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Ephone")
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBOutlet var paynow: UIButton!
    
    @IBAction func Arrow(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Ephone")
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paynow.layer.borderWidth = 1
        paynow.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
