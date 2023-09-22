//
//  PlaceModal.swift
//  FoursquareClone
//
//  Created by Atakan Aktakka on 21.09.2023.
//

import Foundation
import UIKit

class PlaceModal{
    
    static let sharedIntance = PlaceModal()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLongitude = ""
    var placeLatitude = ""
    
    private init(){}
}
