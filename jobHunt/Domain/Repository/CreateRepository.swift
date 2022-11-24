//
//  CreateRepository.swift
//  jobHunt
//
//  Created by 出口楓真 on 2022/11/16.
//

import Foundation

struct CreateRepository {
    
    func isValidated(name: String?) -> Bool {
        guard
            let name = name
        else{ return false }
        let isValidName = !name.isEmpty

        return isValidName
    }
    
}
