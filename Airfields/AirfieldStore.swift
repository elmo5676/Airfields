//
//  AirfieldStore.swift
//  Airfields
//
//  Created by elmo on 1/19/18.
//  Copyright © 2018 Caerus. All rights reserved.
//

import UIKit

class AirfieldStore {
    

    
    
    var airfieldDictionary = [String:Airfield]()
    var filteredAirfieldDictionary = [String:Airfield]()
    
    
    
    // MARK - Delete Old File function
    func deleteFile(fileNamewithExtension fileName: String){
        filteredAirfieldDictionary.removeAll()
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        let destinationFileUrl = documentsUrl.appendingPathComponent(fileName)
        
        let deleter = FileManager()
        do {
            try deleter.removeItem(at: destinationFileUrl)
            
            
            

            
            print("Successfully deleted old file")
            //print(destinationFileUrl)
        } catch let error as NSError {
            print("Unable to delete \(error)")
        }
    }
    
    // MARK - Download Function
    func downloadData(_ sourceFile: String, fileNamewithExtension fileName: String) {
        // Create destination URL
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        let destinationFileUrl = documentsUrl.appendingPathComponent(fileName)
        
        //Create URL to the source file you want to download
        let fileURL = URL(string: sourceFile)
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let request = URLRequest(url:fileURL!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
                
            } else {
                print("Error took place while downloading a file. Error description: %@", error?.localizedDescription as Any);
            }
        }
        task.resume()
        
    }

    
    
}
