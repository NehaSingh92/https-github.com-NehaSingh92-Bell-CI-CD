//
//  HomePageViewController.swift
//  Bell
//
//  Created by Neha Magan Pal Singh on 17/08/2017.
//  Copyright © 2017 Punskyy, Roman. All rights reserved.
//

import UIKit
import Foundation


var ServiceNo = ""
var ServiceNoo = ""
var ServiceNooo = ""
var Username = ""

class HomePageViewController: UIViewController {

    @IBAction func MobilityBill(_ sender: Any)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "bill")
        // self.navigationController?.present(vc!, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    
    @IBAction func myLogout(_ sender: Any)
    {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
        // self.navigationController?.present(vc!, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBOutlet var myname: UILabel!
    
    @IBOutlet var myphone: UILabel!
    
    @IBOutlet var myinternet: UILabel!
    
    @IBOutlet var mytv: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let urlString = "http://portalspoc1.southeastasia.cloudapp.azure.com:8088/api/GetCustomerProfile"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with:url!) { (data, response, error) in
            if error != nil {
                print(error as Any)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                    print(parsedData)
                    Username = (parsedData )["UserName"] as! String
                    print(Username)
                    let employees = parsedData["BilledServices"]! as! [[String : AnyObject]]
                    print(employees)
                    let tt =  parsedData.value(forKeyPath: "BilledServices.Services.ServiceNumber") as! NSArray
                    print(tt )
                    print(tt[0])
                    
                    print(tt[1])
                    
                    
                    let array = tt[0] as! NSArray
                    print(array)
                    let arrayone = tt[1] as! NSArray
                    //print(arrayone)
                    let new_array = array.flatMap { $0 }
                    print(new_array)
                    let new_arrayone = arrayone.flatMap { $0 }
                    //print(new_arrayone)
                    
                    ServiceNo = new_array[0] as! String
                    ServiceNoo = new_arrayone[0] as! String
                    ServiceNooo = new_arrayone[1] as! String
                    
                    print(ServiceNo)
                    print(ServiceNoo)
                    print(ServiceNooo)
                    DispatchQueue.main.async{
                        self.myname.text = Username
                        self.myphone.text = ServiceNo
                        self.myinternet.text = ServiceNoo
                        self.mytv.text = ServiceNooo
                    }
                    
                    
                    
                    
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            
            }.resume()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
