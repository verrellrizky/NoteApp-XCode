//
//  ViewController.swift
//  NoteN
//
//  Created by verrell rizky on 09/11/20.
//

// CONSTRAINTS & LAYOUTS WORK WITH IPHONE 11 PRO

import UIKit

struct Notes {
    var Title:String?
    var Notes:String?
    var Category:String?
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var Header: UILabel!
    
    var receivedTitle:String?
    var receivedNotes:String?
    var receivedCategory:String?
    
    var ArrNotes = [Notes]()
    var myIndex = 0
    var varHeader:Int?
    //
    
    @IBOutlet weak var tvNotes: UITableView!
    
    
    func initialize() {
        ArrNotes.append(Notes(Title: "Sample", Notes: "This is a sample notes", Category: "Category"))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        tvNotes.dataSource = self
        tvNotes.delegate = self
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            ArrNotes.remove(at: indexPath.row)
            tvNotes.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! noteTableViewCell
        
        cell.txtTitle.text = ArrNotes[indexPath.row].Title
        cell.txtNotes.text = ArrNotes[indexPath.row].Notes
        cell.txtCategory.text = ArrNotes[indexPath.row].Category
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //clickable
        myIndex = indexPath.row
        //saat row di click pindah page ke add page
        performSegue(withIdentifier: "segueAdd", sender: self) //click to open edit
        
//        Header.text = "\(Int(myIndex))"
        //contoh testing, row di click & muncul text data dari row tsb (di page yg sama)
        //tfContoh.text = ArrNotes[myIndex].Title
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destin = segue.destination as! AddViewController
        
        if segue.identifier == "segueAdd"{
            destin.editTitle = ArrNotes[myIndex].Title
            destin.editDescription = ArrNotes[myIndex].Notes
            destin.editCategory = ArrNotes[myIndex].Category
            
//            if (destin.editTitle == "" || destin.editDescription == "") {
//                destin.editTitle = ArrNotes[myIndex].Title
//                destin.editDescription = ArrNotes[myIndex].Notes
//            }else{
//                destin.editTitle = ""
//                destin.editDescription = ""
//            }GAJADI
//            destin.varcheckindex = myIndex
            
        }
    }
    
    @IBAction func btnAdd(_ sender: Any) {
//        pakai autosegue
        
    }
    
    @IBAction func unwindToList(_ unwindSegue: UIStoryboardSegue) {
        let source = unwindSegue.source as? AddViewController
        
        receivedTitle = source?.inputTitle
        receivedNotes = source?.inputDesc
        receivedCategory = source?.inputcategory

        if !(receivedTitle == "" || receivedNotes == "" || receivedCategory == "") {
            
            //Edit notes: replace notes to ArrNotes[current array] didn't works well
//            ArrNotes[myIndex].Title = receivedTitle
//            ArrNotes[myIndex].Notes = receivedNotes
//            ArrNotes[myIndex].Category = receivedCategory
            
            ArrNotes.append(Notes(Title: receivedTitle, Notes: receivedNotes, Category: receivedCategory))
        }
        tvNotes.reloadData()
        
    }
    
    
    
    
}

