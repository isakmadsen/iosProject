//
//  ViewController.swift
//  SaveTextWeek7
//
//  Created by admin on 14/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    var theText = "HelloWorld"
    var myArray = [String]()
    var currentRowToEdit: Int? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        myArray.append("Hello")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        textField.text = theText
    }
    @IBAction func saveText(_ sender: UIButton) {
        theText = textField.text!
        if currentRowToEdit != nil {
            myArray[currentRowToEdit!] = theText
            currentRowToEdit = nil
        } else {
            myArray.append(theText)
        }
        tableView.reloadData()
        print(myArray)
        textField.text = ""
        saveStringToFile(str: theText, fileName: "string.txt")
        print(readString(fileName: "string.txt"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1"){
            cell.textLabel?.text = myArray[indexPath.row]
            return cell
            
        } else { return UITableViewCell()
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentRowToEdit = indexPath.row
        textField.text = myArray[currentRowToEdit!]
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
           print("Deleted")
           self.myArray.remove(at: indexPath.row)
           self.tableView.beginUpdates()
           self.tableView.deleteRows(at: [indexPath], with: .automatic)
           self.tableView.endUpdates()
            textField.text = ""
        }
    }
    func saveStringToFile(str:String, fileName:String){
        let filePath = getDocumentDir().appendingPathComponent(fileName)
        do{
            try str.write(to: filePath, atomically: true, encoding: .utf8)
            print("ok")
        } catch {
            print("Error")
        }
    }
    func getDocumentDir() -> URL {
        let documentDir=FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return documentDir[0]
    }
    func readString(fileName:String) -> String {
        let filePath = getDocumentDir().appendingPathComponent(fileName)
        do{
            let string = try String(contentsOf: filePath, encoding: .utf8)
            return string
        } catch {
            print("Error reading " + fileName)
        }
        return "Empty"
    }
}

