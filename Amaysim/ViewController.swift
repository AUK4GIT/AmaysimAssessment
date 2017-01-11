//
//  ViewController.swift
//  Amaysim
//
//  Created by Uday Kiran Ailapaka on 10/01/17.
//  Copyright © 2017 Uday Kiran Ailapaka. All rights reserved.
//

import UIKit

class ViewController: ContainerVC {
@IBOutlet weak var container: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func presentNinjaView() {
        self.cycleFromViewController(oldC: nil, toViewController: (self.storyboard?.instantiateViewController(withIdentifier: "MyContactsNinjaVC"))!, onContainer: self.container);
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueName = segue.identifier {
            print(segueName)
            if segueName == "MenuVC" {
                //                let menuVC: MenuVC = segue.destinationViewController as! MenuVC
                //                menuVC.view.tag = 101;
            } else if segueName == "DummyVC" {
                let dummyVC = segue.destination
                dummyVC.view.tag = 101;
            }
            else    {
            }
        }
    }

}

