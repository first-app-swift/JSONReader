//
//  FileData.swift
//  DataViewer
//
//  Created by Amey Ranade on 20/04/21.
//

import Foundation

class ParseFile : ObservableObject{
    //    @Published var result :[String : Any] = [:]
    
    
    static func fileData() -> [Result]
    {
        
        
        let path = Bundle.main.path(forResource: "Setting", ofType: "bundle")
        let newPath  = Bundle.init(path: path!)?.path(forResource: "country", ofType: "json")
        let url = URL(fileURLWithPath: newPath!)
        var result : [Result] = []
        do{
            let jsonData =  try Data(contentsOf: url)
            result = try JSONDecoder().decode([Result].self, from: jsonData)
            
            return result
        } catch{
            print("error")
            return result
        }
        
    }
    
}

struct Result : Decodable, Identifiable

{
    
    let id = UUID()
    var results : [String : Any] = [:]
    
    var displayString : String
    private struct DynamicCodingKeys: CodingKey {
        
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
    
    init(from decoder: Decoder) throws {
        
        
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
        
        var dictionary : [String : Any] = [:]
        for key in container.allKeys {
            let firstName = try container.decode(String.self, forKey: key)
            print(firstName)
            dictionary[key.stringValue] = firstName
        }
        
        
        
        results = dictionary
        var newData = ""
        for (key, value) in results.enumerated()
        {
            newData += value.key + " : " + (value.value as! String) + "\n"
        }
        displayString = newData
        
    }
}



