//
//  AddViewController.swift
//  NoteN
//
//  Created by verrell rizky on 09/11/20.
//

// CONSTRAINTS & LAYOUTS WORK WITH IPHONE 11 PRO

import UIKit

class AddViewController: UIViewController {
    
    
    @IBOutlet weak var editHeader: UILabel!
    
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var tfDescription: UITextView!
    
    
//    @IBOutlet weak var checkindex: UILabel!
    
//    @IBOutlet weak var TitleTest: UILabel!
//    @IBOutlet weak var NoteTest: UILabel!
    
//    var varcheckindex:Int?
    
    var inputTitle:String?
    var inputcategory:String?
    var inputDesc:String?

    var editTitle:String?
    var editCategory:String?
    var editDescription:String?
    
    
    
    
    var ArrNotes = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTF()
        receiveFromEdit()
//        checkindex.text = "\(Int(varcheckindex!))"
    }
    
    var inputTitleone:String?
    var inputDescone:String?
    
    let minimumAlert = UIAlertController(title: "Minimum characters", message: "Notes description must be more than 20", preferredStyle: .alert)
    let FilledAlert = UIAlertController(title: "All field must be filled", message: "please fill all the field to continue", preferredStyle: .alert)
    let success = UIAlertController(title: "Success", message: "Data saved to notes", preferredStyle: .alert)
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    @IBAction func btnSave(_ sender: Any) {
       getTF()
        
        
        
        if (inputTitle == "" || inputcategory == "" || inputDesc == "") {
            FilledAlert.addAction(ok)
            present(FilledAlert, animated: true, completion: nil)
            
        }else if (inputDesc!.count < 20){
            minimumAlert.addAction(ok)
            present(minimumAlert, animated: true, completion: nil)
        }
        
        else{
            ArrNotes.append(Notes(Title: inputTitle, Notes: inputDesc))
            success.addAction(ok)
            present(success, animated: true, completion: nil)
            tfTitle.text = ""
            tfCategory.text = ""
            tfDescription.text = ""
            //Edit notes: replace notes to ArrNotes[current array] didn't works well
//            ArrNotes[(Int(varcheckindex!))].Title = inputTitle
//            ArrNotes[(Int(varcheckindex!))].Notes = inputDesc
//            ArrNotes[(Int(varcheckindex!))].Category = inputcategory
        }
        
    }
    
    

    
    func receiveFromEdit() {
        tfTitle.text = editTitle
        tfCategory.text = editCategory
        tfDescription.text = editDescription
    }

    func getTF(){
        inputTitle = tfTitle.text!
        inputcategory = tfCategory.text!
        inputDesc = tfDescription.text!
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
