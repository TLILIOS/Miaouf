//
//  CatFormViewController.swift
//  Miawouf
//
//  Created by HAMDI TLILI on 25/04/2023.
//

import UIKit

class CatFormViewController: UIViewController {
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var majoritySwitch: UISwitch!
    @IBOutlet weak var racePickerView: UIPickerView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBAction func dismissKeybord(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
    }
    
    @IBAction func validate(_ sender: Any) {
        let pet = createPetObject()
        checkPetStatus(pet)
    }
    private func checkPetStatus(_ pet: Pet) {
        switch pet.status {
            
        case .accepted:
            performSegue(withIdentifier: "segueToSuccessCat", sender: pet)
        case .rejected(let error):
           presentAlert(with: error)
        }
    }
    private func presentAlert(with error: String) {
        let alert: UIAlertController = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func createPetObject() -> Pet {
        let name = nameTextField.text
        let phone = phoneTextField.text
        let hasMajority = majoritySwitch.isOn
        let gender: Pet.Gender = genderSegmentedControl.selectedSegmentIndex == 0 ? .female : .male
        let raceIndex = racePickerView.selectedRow(inComponent: 0)
        let race = catRaces[raceIndex]
        return Pet(name: name, hasMajority: hasMajority, phone: phone, race: race, gender: gender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToSuccessCat" {
            let successVC = segue.destination as? CatSuccessViewController
            let pet = sender as? Pet
            successVC?.pet = pet
        }
    }
}
extension CatFormViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        catRaces.count
    }
    
    
}
extension CatFormViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return catRaces[row]
    }
}
extension CatFormViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
