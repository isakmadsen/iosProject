//
//  EmailUs.swift
//  YouSee
//
//  Created by admin on 07/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EmailUs: UIViewController {

    @IBOutlet weak var TextF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendBtn(_ sender: Any) {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var next:Recap = segue.destination as! Recap
        next.recapString = TextF.text
        print("line 26")
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

