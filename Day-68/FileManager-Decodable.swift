import Foundation

extension FileManager {
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        
        
    }
    func encode<T: Codable>(data: T, file: String) {
        let url = getDocumentDirectory().appendingPathComponent(file)
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(data) else {
            print("Failed to encode data")
            fatalError("Failed to encode data \(data)")
        }
        do {
            try encoded.write(to: url)
        } catch {
            fatalError("Error encoded to data \(url)")
        }
    }
    
    func decode<T: Codable>(file: String) -> T {
        let url = getDocumentDirectory().appendingPathComponent(file)
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
        return loadedData
    }
}

/* Usage: 
Button("Add To Doc"){
  FileManager.default.encode(data: "This is a test", file: "message.txt")
                        let result:String = FileManager.default.decode(file: "message.txt") ?? "Failed to decode"
                        print("result : \(result)")
}
//
