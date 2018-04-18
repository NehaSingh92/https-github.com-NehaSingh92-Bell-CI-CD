//
//  ViewController.swift
//  SampleApp-Swift
//
//  Copyright (c) 2014 PayPal. All rights reserved.
//

import UIKit


class ViewController: UIViewController, CardIOPaymentViewControllerDelegate {

   
    @IBOutlet weak var scan1: UIButton!
    
    @IBAction func scan2(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Scan")
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
   
    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        scan1.layer.cornerRadius = 5
        scan1.layer.borderWidth = 1
        scan1.layer.borderColor = UIColor.white.cgColor
        
        
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self,action: Selector(backAction))
        
    // Do any additional setup after loading the view, typically from a nib.
    CardIOUtilities.preload()
    
//        _=navigationController?.popViewController(animated: true)
        
        
        
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
    
    @IBAction func scancards(_ sender: Any) {
        
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC?.modalPresentationStyle = .formSheet
        present(cardIOVC!, animated: true, completion: nil)
        cardIOVC?.maskManualEntryDigits = true
        
        
    }
    
    
    func backAction(){
        
        dismiss(animated: true,completion: nil)
    }

  
  func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
    resultLabel.text = "             No card scanned"
    paymentViewController?.dismiss(animated: true, completion: nil)
  }
  
  func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
    
    if let info = cardInfo {
        
        var card:String = info.cardNumber
//        let apple = String(card.characters.prefix(4))
        let apple = "xxxx "
        let orange = String(card.characters.suffix(4))
        print("\(apple)********\(orange)")
        let demo = "xxxx xxxx "
        card = apple + demo + orange
        
        
//        var card2:String = info.cardNumber
//        let abc = String(card2.characters.prefix(4))
//        let def = String(card2.characters.suffix(4))
//        print("\(abc)********\(def)")
//        let demos = "xxxxxxxx"
//        card2 = abc + demos + def
//
       
        
        
        
       //card =  (apple)********(orange)
      //let str = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
         let str = NSString(format: "Card Number: %@\nCard Expiry   : %02lu/%lu\n",card, info.expiryMonth, info.expiryYear)
        
        
        
//        let sim = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n",card2, info.expiryMonth, info.expiryYear)
      //var card = info.cardNumber
       
        
        
        
      resultLabel.text = str as String
      
//         resultlabel2.text = sim as String
        UserDefaults.standard.set(str, forKey: "Details")
        
       
//        UserDefaults.standard.set(sim, forKey: "Raju")
  
    
    
  
        
      
        
    
    
    paymentViewController?.dismiss(animated: true, completion: nil)
  }
}
}
