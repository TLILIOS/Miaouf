//
//  SuccessViewController.swift
//  Miawouf
//
//  Created by HAMDI TLILI on 22/04/2023.
//

import UIKit

class SuccessViewController: UIViewController {
    var pet: Pet!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setWelcomeLabel()
        
    }
    private func setWelcomeLabel() {
        if let name = pet.name {
            welcomeLabel.text = """
Wouf de bienvenue à  \(name) !

            Vous avez bien été ajouté a notre base de donnée ! Nous vous enverrons un SMS dès que nous avons une ame soeur à  vous proposer !
"""
        }
    }
}
