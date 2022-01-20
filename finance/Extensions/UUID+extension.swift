//
//  UUID+extension.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

import Foundation

extension UUID {
    
    static var zero: UUID {
        get { return UUID(uuidString: "00000000-0000-0000-0000-000000000000")! }
    }
    
}
