//
//  DetailViewController.swift
//  CustomActivityIndicator
//
//  Created by Sanjit Shaw on 17/09/18.
//  Copyright © 2018 Sanjit Shaw. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var indicatorType : ActivityIndicatorType = .eNativeGray

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customIndicator = ActivityLoader(typeOfIndicator: indicatorType)
        customIndicator.imageName = "Img_confirmation_checkmark_60x60"
        customIndicator.indicatorAlignment = .eTopAlign
        //customIndicator.gradientColorSet = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor]
        customIndicator.gradientColorSet = [UIColor(red: 255.0/255.0, green: 206.0/255.0, blue: 10.0/255.0, alpha: 1.0).cgColor, UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 120.0/255.0, alpha: 1.0).cgColor]
        customIndicator.showLoader(displayMessage: NSAttributedString(string: "Verifying and loading....", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16.0), NSAttributedStringKey.foregroundColor : UIColor.white]), overView: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            customIndicator.removeIndicator()
        }

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
