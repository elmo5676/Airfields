//
//  AirfileldTableViewController.swift
//  Airfields
//
//  Created by elmo on 1/18/18.
//  Copyright © 2018 Caerus. All rights reserved.
//

import UIKit

class AirfieldTableViewController: UITableViewController {

    var listOfAirfields: [Any] = []
    var runwayInformation: [Any] = []
    var filteredAirfieldDictionary = [String:Airfield]()
    let airportGeoJSONFileNameWithExtension = "Airports.geojson"
    let runwayGeoJSONFileNameWithExtension = "Runway.geojson"
    
    func loadRunwayGeoJSNFileIntoReadableFormat(_ fileName: String){
        let fileName = fileName
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        let destinationFileUrl = documentsUrl.appendingPathComponent(fileName)
        let path: String = destinationFileUrl.path
        if let data = NSData.init(contentsOfFile: path){
            if let runwayDictionary = try? JSONSerialization.jsonObject(with: data as Data, options: []){
                let dictionary =  runwayDictionary as! [String: Any]
                runwayInformation = dictionary["features"] as! [Any]
                print(runwayInformation.count)
            }
        }
        
        
    }
    
    
    func loadAirportGeoJSONFileIntoReadableFormat(_ fileName: String){
        let fileName = fileName
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        let destinationFileUrl = documentsUrl.appendingPathComponent(fileName)
        let path: String = destinationFileUrl.path
        if let data = NSData.init(contentsOfFile: path) {
            if let airfieldDictionary = try? JSONSerialization.jsonObject(with: data as Data, options: []){
                let dictionary = airfieldDictionary as! [String:Any]
                listOfAirfields = dictionary["features"] as! [Any]

                for airfieldInList in 0..<listOfAirfields.count {
                    let airfield = listOfAirfields[airfieldInList] as! [String:Any]
                    if let properties = airfield["properties"] as! [String:Any?]? {
                        if let airfieldID = properties["ICAO_ID"] as! String? {

                            let ICAO_ = airfieldID
                            var name_ = ""
                            var objectID_ = 0
                            var globalID_ = ""
                            var state_ = ""
                            var country_ = ""
                            var milCode_ = ""
                            var iapExists_ = 1
                            var latitude_ = 0.0
                            var longitude_ = 0.0
                            var elevation_ = 0.0
                            var ident_ = ""
                            var latitudeString_ = ""
                            var longitudeString_ = ""
                            var typeCode_ = ""
                            var serviceCity_ = ""
                            var operationalStatus_ = ""
                            var privateUse_ = 0
                            var DOD_H_Flip_ = 0
                            var FAR91_ = 0
                            var FAR93_ = 0
                            var airAnal_ = ""
                            var US_High_ = 0
                            var US_Low_ = 0
                            var AK_High_ = 0
                            var AK_Low_ = 0
                            var US_Area_ = 0
                            var pacific_ = 0



                            if let airfieldName = properties["NAME"] as! String? {
                                name_ = airfieldName
                                //print("Name: \(airfieldName)")
                            }
                            if let airfieldObjectID = properties["OBJECTID"] as! Int? {
                                objectID_ = airfieldObjectID
                                //print("Global ID: \(airfieldGlobalID)")
                            }
                            if let airfieldGlobalID = properties["GLOBAL_ID"] as! String? {
                                globalID_ = airfieldGlobalID
                                //print("Global ID: \(airfieldGlobalID)")
                            }
                            if let airfieldState = properties["STATE"] as! String? {
                                state_ = airfieldState
                                //print("State: \(airfieldState)")
                            }
                            if let airfieldCountry = properties["COUNTRY"] as! String? {
                                country_ = airfieldCountry
                                //print("Country: \(airfieldCountry)")
                            }
                            if let airfieldMilCode = properties["MIL_CODE"] as! String? {
                                milCode_ = airfieldMilCode
                                //print("Mil Code: \(airfieldMilCode)")
                            }
                            if let airfieldIAPExists = properties["IAPEXISTS"] as! Int? {
                                iapExists_ = airfieldIAPExists
                                //print("Instrument Approach Exists: \(airfieldIAPExists)")
                            }
                            if let airfieldIdent = properties["IDENT"] as! String? {
                                ident_ = airfieldIdent
                                //print("Instrument Approach Exists: \(airfieldIdent)")
                            }
                            if let airfieldLatitudeString = properties["LATITUDE"] as! String? {
                                latitudeString_ = airfieldLatitudeString
                                //print("Instrument Approach Exists: \(airfieldLatitudeString)")
                            }
                            if let airfieldLongitudeString = properties["LONGITUDE"] as! String? {
                                longitudeString_ = airfieldLongitudeString
                                //print("Instrument Approach Exists: \(airfieldLongitudeString)")
                            }
                            if let airfiledTypeCode = properties["TYPE_CODE"] as! String? {
                                typeCode_ = airfiledTypeCode
                                //print("Instrument Approach Exists: \(airfiledTypeCode)")
                            }
                            if let airfieldServiceCity = properties["SERVCITY"] as! String? {
                                serviceCity_ = airfieldServiceCity
                                //print("Instrument Approach Exists: \(airfieldServiceCity)")
                            }
                            if let airfieldOperationalStatus = properties["OPERSTATUS"] as! String? {
                                operationalStatus_ = airfieldOperationalStatus
                                //print("Instrument Approach Exists: \(airfieldOperationalStatus)")
                            }
                            if let airfieldPrivateUse = properties["PRIVATEUSE"] as! Int? {
                                privateUse_ = airfieldPrivateUse
                                //print("Instrument Approach Exists: \(airfieldPrivateUse)")
                            }
                            if let airfieldDOD_H_Flip = properties["DODHIFLIP"] as! Int? {
                                DOD_H_Flip_ = airfieldDOD_H_Flip
                                //print("Instrument Approach Exists: \(airfieldDOD_H_Flip)")
                            }
                            if let airfieldFAR91 = properties["FAR91"] as! Int? {
                                FAR91_ = airfieldFAR91
                                //print("Instrument Approach Exists: \(airfieldFAR91)")
                            }
                            if let airfieldFAR93 = properties["FAR93"] as! Int? {
                                FAR93_ = airfieldFAR93
                                //print("Instrument Approach Exists: \(airfieldFAR93)")
                            }
                            if let airfieldAirAnal = properties["AIRANAL"] as! String? {
                                airAnal_ = airfieldAirAnal
                                //print("Instrument Approach Exists: \(airfieldAirAnal)")
                            }
                            if let airfieldUS_High = properties["US_HIGH"] as! Int? {
                                US_High_ = airfieldUS_High
                                //print("Instrument Approach Exists: \(airfieldUS_High)")
                            }
                            if let airfieldUS_Low = properties["US_LOW"] as! Int? {
                                US_Low_ = airfieldUS_Low
                                //print("Instrument Approach Exists: \(airfieldUS_Low)")
                            }
                            if let airfieldAK_High = properties["AK_HIGH"] as! Int? {
                                AK_High_ = airfieldAK_High
                                //print("Instrument Approach Exists: \(airfieldAK_High)")
                            }
                            if let airfieldAK_Low = properties["AK_LOW"] as! Int? {
                                AK_Low_ = airfieldAK_Low
                                //print("Instrument Approach Exists: \(airfieldAK_Low)")
                            }
                            if let airfieldUS_Area = properties["US_AREA"] as! Int? {
                                US_Area_ = airfieldUS_Area
                                //print("Instrument Approach Exists: \(airfieldUS_Area)")
                            }
                            if let airfieldPacific = properties["PACIFIC"] as! Int? {
                                pacific_ = airfieldPacific
                                //print("Instrument Approach Exists: \(airfieldPacific)")
                            }
                            if let airfieldElevation = properties["ELEVATION"] as! Double? {
                                elevation_ = airfieldElevation
                                //print("Elevation: \(airfieldElevation)")
                                if let geometry = airfield["geometry"] as! [String:Any]? {
                                    if let coordinates = geometry["coordinates"] as! [Double]? {
                                        latitude_ = coordinates[0]
                                        longitude_ = coordinates[1]
                                        let newAirfieldID = Airfield(ICAO: ICAO_,
                                                                     name: name_,
                                                                     objectID: objectID_,
                                                                     globalID: globalID_,
                                                                     state: state_,
                                                                     country: country_,
                                                                     milCode: milCode_,
                                                                     iapExists: iapExists_,
                                                                     latitude: latitude_,
                                                                     longitude: longitude_,
                                                                     elevation: elevation_,
                                                                     ident: ident_,
                                                                     latitudeString: latitudeString_,
                                                                     longitudeString: longitudeString_,
                                                                     typeCode: typeCode_,
                                                                     serviceCity: serviceCity_,
                                                                     operationalStatus: operationalStatus_,
                                                                     privateUse: privateUse_,
                                                                     DOD_H_Flip: DOD_H_Flip_,
                                                                     FAR91: FAR91_,
                                                                     FAR93: FAR93_,
                                                                     airAnal: airAnal_,
                                                                     US_High: US_High_,
                                                                     US_Low: US_Low_,
                                                                     AK_High: AK_High_,
                                                                     AK_Low: AK_Low_,
                                                                     US_Area: US_Area_,
                                                                     pacific: pacific_
                                                                     )

                                        filteredAirfieldDictionary[ICAO_] = newAirfieldID
                                    }
                                }
                            }
                        }

                    }

                }
            }
        }
    }
    
    @IBAction func reloadTableButton(_ sender: UIBarButtonItem) {
        filteredAirfieldDictionary.removeAll()
        loadRunwayGeoJSNFileIntoReadableFormat(runwayGeoJSONFileNameWithExtension)
        loadAirportGeoJSONFileIntoReadableFormat(airportGeoJSONFileNameWithExtension)
        print(filteredAirfieldDictionary)
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAirportGeoJSONFileIntoReadableFormat(airportGeoJSONFileNameWithExtension)
        loadRunwayGeoJSNFileIntoReadableFormat(runwayGeoJSONFileNameWithExtension)
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfAirfields.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airField", for: indexPath)
        let airfieldArray = Array(filteredAirfieldDictionary.keys)
        var airfield: String
        if airfieldArray.count > 0 {
            airfield = airfieldArray[indexPath.row]
        } else {
            airfield = ""
        }
        
        cell.textLabel?.text = airfield
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
