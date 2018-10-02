//
//  ViewController.swift
//  CustomActivityIndicator
//
//  Created by Sanjit Shaw on 09/08/18.
//  Copyright © 2018 Sanjit Shaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let a = ["ag" : 23,"zs": 24,"c":34, "d": 29]
        let x = a.sorted{$0.1 < $1.1}.map{$0.0}
        print(x)
        /*var a : NSString? = "abc"
        var b : NSString = a!
        b = "xyz"
        var c : NSString = b.copy() as! NSString
        c = "aaaa"
        a = nil
        print(a)
        print(b)
        print(c)*/
        
        
        /*let smallView = UIView(frame: CGRect(x: 100, y: 150, width: 100, height: 100))
        smallView.backgroundColor = UIColor.white
        view.addSubview(smallView)
        
        let smallView1 = UIView(frame: CGRect(x: 100, y: 350, width: 100, height: 100))
        smallView1.backgroundColor = UIColor.red
        //view.addSubview(smallView1)
        
        let customLoader = ActivityLoader(typeOfIndicator: .eCustomSmall)
        customLoader.gradientColorSet = [UIColor(red: 255.0/255.0, green: 206.0/255.0, blue: 10.0/255.0, alpha: 1.0).cgColor, UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 120.0/255.0, alpha: 1.0).cgColor]
        customLoader.showLoader(displayMessage: nil, overView: smallView)
        
        //ActivityLoader(typeOfIndicator: .eNativeWhiteLarge).showLoader(displayMessage: "", overView: smallView1)
        
        let customIndicator = ActivityLoader(typeOfIndicator: .eCustomLarge)
        customIndicator.imageName = "Img_confirmation_checkmark_60x60"
        customIndicator.indicatorAlignment = .eTopAlign
        //customIndicator.gradientColorSet = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor, UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor]
        customIndicator.gradientColorSet = [UIColor(red: 255.0/255.0, green: 206.0/255.0, blue: 10.0/255.0, alpha: 1.0).cgColor, UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 120.0/255.0, alpha: 1.0).cgColor]
        customIndicator.showLoader(displayMessage: NSAttributedString(string: "Verifying and loading....", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 16.0), NSAttributedStringKey.foregroundColor : UIColor.white]), overView: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            customIndicator.removeIndicator()
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationController = segue.destination as! DetailViewController
        
        let indexPath = sender as! IndexPath
        switch indexPath.row {
        case 0:
            destinationController.indicatorType = .eCustomLarge
        case 1:
            destinationController.indicatorType = .eCustomSmall
        case 2:
            destinationController.indicatorType = .eNativeWhite
        case 3:
            destinationController.indicatorType = .eNativeGray
        case 4:
            destinationController.indicatorType = .eNativeWhiteLarge
        case 5:
            destinationController.indicatorType = .eImageIndicator
        default:
            destinationController.indicatorType = .eNativeGray
        }
    }
    
    
}

extension ViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "OpenDetail", sender: indexPath)
    }
}

extension ViewController : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IndicatorStyle")
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "CustomLarge"
        case 1:
            cell?.textLabel?.text = "CustomSmall"
        case 2:
            cell?.textLabel?.text = "NativeWhite"
        case 3:
            cell?.textLabel?.text = "NativeGray"
        case 4:
            cell?.textLabel?.text = "NativeWhiteLarge"
        case 5:
            cell?.textLabel?.text = "ImageIndicator"
        default:
            cell?.textLabel?.text = ""
        }
        return cell!
    }
    
    
}




