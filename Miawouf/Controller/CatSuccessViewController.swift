//
//  CatSuccessViewController.swift
//  Miawouf
//
//  Created by HAMDI TLILI on 25/04/2023.
//

import UIKit

class CatSuccessViewController: UIViewController {
    var pet: Pet!
    
    @IBOutlet weak var catWelcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setCatWelcomeLabel()
    }
    private func setCatWelcomeLabel() {
        if let name = pet.name {
            catWelcomeLabel.text = """
Wouf de bienvenue à  \(name) !

            Vous avez bien été ajouté a notre base de donnée ! Nous vous enverrons un SMS dès que nous avons une ame soeur à  vous proposer !
"""
        }
    }
}

