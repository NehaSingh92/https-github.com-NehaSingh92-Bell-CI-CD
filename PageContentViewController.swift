//
//  PageContentViewController.swift
//  Bell
//
//  Created by Neha Magan Pal Singh on 17/08/2017.
//  Copyright © 2017 Punskyy, Roman. All rights reserved.
//

import UIKit
var username = ""

class PageContentViewController: UIViewController {
    
    @IBAction func myskip(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    
    
    
  
    @IBOutlet var lblTitle: UILabel!
    
    
    
    @IBOutlet var imageView: UIImageView!
    
    var pageIndex: Int = 0
    var strTitle: String!
    var strPhotoName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        imageView.image = UIImage(named: strPhotoName)
        lblTitle.isHidden = true // hide
        //lblTitle.text = strTitle
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        lblTitle.isHidden = true // hide
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
     
    
    
    
}


