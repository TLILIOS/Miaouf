//
//  Pet.swift
//  Miawouf
//
//  Created by HAMDI TLILI on 03/05/2023.
//

import Foundation
struct Pet {
    enum Gender {
        case female, male
    }
    
    var name: String?
    var hasMajority: Bool
    var phone: String?
    var race: String?
    var gender: Gender
}
extension Pet {
    enum Status {
        case accepted, rejected(String)
    }
    var status: Status {
        if name == nil || name == "" {
            return .rejected("Indiquez votre nom SVP !")
        }
        if phone == nil || phone == "" {
            return .rejected("Indiquez votre téléphone SVP !")
        }
        if race == nil || race == "" {
            return .rejected("Quel est votre race ?")
        }
        if !hasMajority {
            return .rejected("Les mineurs ne sont pas admis !")
        }
        return .accepted
    }
    
}
