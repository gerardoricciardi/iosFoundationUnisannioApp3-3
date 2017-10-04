//
//  UserHealthProfile.swift
//  iosFoundationUnisannioApp3-3
//
//  Created by Ricciardi Gerardo on 03/10/17.
//  Copyright © 2017 Ricciardi Gerardo. All rights reserved.
//

import Foundation
import HealthKit

class UserHealthProfile {
    
    var age: Int?
    var biologicalSex: HKBiologicalSex?
    var bloodType: HKBloodType?
    var heightInMeters: Double?
    var weightInKilograms: Double?
    
    var bodyMassIndex: Double? {
        
        guard let weightInKilograms = weightInKilograms,
            let heightInMeters = heightInMeters,
            heightInMeters > 0 else {
                return nil
        }
        
        return (weightInKilograms/(heightInMeters*heightInMeters))
    }
}
