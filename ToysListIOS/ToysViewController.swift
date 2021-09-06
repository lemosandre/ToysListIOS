//
//  ToysViewController.swift
//  ToysListIOS
//
//  Created by Andre Lemos on 2021-09-02.
//

import UIKit
import Firebase

class ToysViewController: UIViewController {
    
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldState: UITextField!
    @IBOutlet weak var textFieldOwner: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    
    var toysItem: ToysItem?
    let collection = "toysLIst"
    lazy var firestore: Firestore = {
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        let firestore = Firestore.firestore()
        firestore.settings = settings
        return firestore
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let toysItem = toysItem{
            title = "Edicao"
            textFieldName.text = toysItem.name
            textFieldState.text = toysItem.conservation
            textFieldOwner.text = toysItem.nameOwner
            textFieldAddress.text = toysItem.address
            textFieldPhone.text = "\(toysItem.phone)"
            buttonSave.setTitle("Editar", for: .normal)
        }
        
    }
    

    
    
    @IBAction func buttonSave(_ sender: Any) {
        
        guard let name = textFieldName.text, let conservation = textFieldState.text,
              let nameOwner = textFieldOwner.text, let address = textFieldAddress.text, let phoneString = textFieldPhone.text, let phone = Int(phoneString) else { return }
       
        let data : [String: Any] = [
            "name": name,
            "conservation": conservation,
            "nameOwner": nameOwner,
            "address": address,
            "phone": phone
        ]
        
        if let item = toysItem{
            self.firestore.collection(self.collection).document(item.id).updateData(data)
            navigationController?.popViewController(animated: true)
        }else{
            self.firestore.collection(self.collection).addDocument(data: data)
            navigationController?.popViewController(animated: true)
        }
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
