//
//  LoadViewController.swift
//  Airfields
//
//  Created by elmo on 1/21/18.
//  Copyright © 2018 Caerus. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {

    let airportGeoJSONFileNameWithExtension = "Airports.geojson"
    let airportSourceFile = "http://ais-faa.opendata.arcgis.com/datasets/e747ab91a11045e8b3f8a3efd093d3b5_0.geojson"
    let runwayGeoJSONFileNameWithExtension = "Runways.geojson"
    let runwaySourceFile = "http://ais-faa.opendata.arcgis.com/datasets/4d8fa46181aa470d809776c57a8ab1f6_0.geojson"
    let newData = AirfieldStore()

    @IBAction func deleteButton(_ sender: UIButton) {
        newData.deleteFile(fileNamewithExtension: airportGeoJSONFileNameWithExtension)
        newData.deleteFile(fileNamewithExtension: runwayGeoJSONFileNameWithExtension)
        let alertController = UIAlertController(title: "Succesfully Cleared", message:
            "Old file has been succesfully deleted from the device.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func loadButton(_ sender: UIButton) {
        newData.downloadData(airportSourceFile, fileNamewithExtension: airportGeoJSONFileNameWithExtension)
        newData.downloadData(runwaySourceFile, fileNamewithExtension: runwayGeoJSONFileNameWithExtension)
        
        let alertController = UIAlertController(title: "Succesfully Loaded", message:
            "New file has been succesfully loaded to the device.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func reloadButton(_ sender: UIButton) {
        newData.deleteFile(fileNamewithExtension: airportGeoJSONFileNameWithExtension)
        newData.downloadData(airportSourceFile, fileNamewithExtension: airportGeoJSONFileNameWithExtension)
        newData.deleteFile(fileNamewithExtension: runwayGeoJSONFileNameWithExtension)
        newData.downloadData(runwaySourceFile, fileNamewithExtension: runwayGeoJSONFileNameWithExtension)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
