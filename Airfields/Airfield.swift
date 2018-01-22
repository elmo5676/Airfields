//
//  Airfield.swift
//  Airfields
//
//  Created by elmo on 1/19/18.
//  Copyright © 2018 Caerus. All rights reserved.
//

import Foundation


struct Airfield {
    
    var ICAO: String = ""
    var name: String = ""
    var objectID: Int = 0
    var globalID: String = ""
    var state: String = ""
    var country: String = ""
    var milCode: String = ""
    var iapExists: Int = 1
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var elevation: Double = 0.0
    var ident: String = ""
    var latitudeString: String = ""
    var longitudeString: String = ""
    var typeCode: String = ""
    var serviceCity: String = ""
    var operationalStatus: String = ""
    var privateUse: Int = 0
    var DOD_H_Flip: Int = 0
    var FAR91: Int = 0
    var FAR93: Int = 0
    var airAnal: String = ""
    var US_High: Int = 0
    var US_Low: Int = 0
    var AK_High: Int = 0
    var AK_Low: Int = 0
    var US_Area: Int = 0
    var pacific: Int = 0
    
    init(ICAO: String,
        name: String,
        objectID: Int,
        globalID: String,
        state: String,
        country: String,
        milCode: String,
        iapExists: Int,
        latitude: Double,
        longitude: Double,
        elevation: Double,
        ident: String,
        latitudeString: String,
        longitudeString: String,
        typeCode: String,
        serviceCity: String,
        operationalStatus: String,
        privateUse: Int,
        DOD_H_Flip: Int,
        FAR91: Int,
        FAR93: Int,
        airAnal: String,
        US_High: Int,
        US_Low: Int,
        AK_High: Int,
        AK_Low: Int,
        US_Area: Int,
        pacific: Int){
        
        
        self.ICAO = ICAO
        self.name = name
        self.objectID = objectID
        self.globalID = globalID
        self.state = state
        self.country = country
        self.milCode = milCode
        self.iapExists = iapExists
        self.latitude = latitude
        self.longitude = longitude
        self.elevation = elevation
        self.ident = ident
        self.latitudeString = latitudeString
        self.longitudeString = longitudeString
        self.typeCode = typeCode
        self.serviceCity = serviceCity
        self.operationalStatus = operationalStatus
        self.privateUse = privateUse
        self.DOD_H_Flip = DOD_H_Flip
        self.FAR91 = FAR91
        self.FAR93 = FAR93
        self.airAnal = airAnal
        self.US_High = US_High
        self.US_Low = US_Low
        self.AK_High = AK_High
        self.AK_Low = AK_Low
        self.US_Area = US_Area
        self.pacific = pacific
        
        
    }
    
}


