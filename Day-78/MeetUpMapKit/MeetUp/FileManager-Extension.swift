//
//  FileManager-Extension.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import Foundation

extension FileManager {
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path.first!
    }
    
    func encode<T: Codable>(data: T, file: String) {
        let url = getDocumentDirectory().appendingPathComponent(file)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        guard let encoded = try? encoder.encode(data) else {
            print("Failed to encode data")
            fatalError("Failed to encode data \(data)")
        }
        
        do {
            try encoded.write(to: url, options: [.atomic, .completeFileProtection])
            print("Successfully saved data to: \(url.path)")
        } catch {
            print("Error writing to file: \(error.localizedDescription)")
            fatalError("Error saving data to \(url)")
        }
    }
    
    func decode<T: Codable>(file: String) -> T? {
        let url = getDocumentDirectory().appendingPathComponent(file)
        guard let data = try? Data(contentsOf: url) else {
            print("File \(file) not found in documents directory - this is normal on first launch")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            print("Failed to decode \(file)")
            return nil
        }
        
        return loadedData
    }
}
