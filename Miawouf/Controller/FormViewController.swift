//
//  FormViewController.swift
//  Miawouf
//
//  Created by HAMDI TLILI on 22/04/2023.
//

import UIKit

final class FormViewController: UIViewController, UITextFieldDelegate {
    var dog: Pet!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var racePickerView: UIPickerView!
    
    @IBOutlet weak var majoritySwitch: UISwitch!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextFeild: UITextField!
}
extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        dogRaces.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dogRaces[row]
    }
}
extension FormViewController {
    @IBAction func validate(_ sender: Any) {
        let pet = createPetObject()
        checkPetStatus(pet)
    }
    private func checkPetStatus(_ pet: Pet) {
        switch pet.status {
            
        case .accepted:
            performSegue(withIdentifier: "segueToSuccess", sender: pet)
        case .rejected(let error):
            presentAlert(with: error)
        }
    }
    private func presentAlert(with error: String) {
        let alert: UIAlertController = UIAlertController(title: "Erreur", message: "error", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    private func createPetObject() -> Pet {
        let name = nameTextField.text
        let phone = phoneTextFeild.text
        let hasMajority = majoritySwitch.isOn
        let gender: Pet.Gender = genderSegmentedControl.selectedSegmentIndex == 0 ? .female: .male
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = dogRaces[raceIndex]
        
        return Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
    }
}
extension FormViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccess" {
            let successVC = segue.destination as? SuccessViewController
            let pet = sender as? Pet
            successVC?.pet = pet
        }
    }
}
    
       
    
    extension FormViewController {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        @IBAction func dismissKeybord(_ sender: UITapGestureRecognizer) {
            nameTextField.resignFirstResponder()
            phoneTextFeild.resignFirstResponder()
        }
    }

