//
//  Recap.swift
//  YouSee
//
//  Created by admin on 07/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class Recap: UIViewController {
    @IBOutlet weak var label: UILabel!
    var recapString:String!
    func update() {
        print("Hello")
        self.label.text=recapString
        print(recapString)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        update()
        print(recapString)
        print("Should be updated")
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
