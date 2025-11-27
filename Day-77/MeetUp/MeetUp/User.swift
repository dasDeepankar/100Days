//
//  Person.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import Foundation
import UIKit

struct Person: Codable, Identifiable, Comparable {
    var id = UUID()
    var name: String
    var description: String
    var personImage: Data
    
    var inputImage: UIImage {
        if let image = UIImage(data: personImage) {
            return image
        }else{
            return UIImage(resource: .person0)
        }
    }
    static func < (lhs: Person, rhs: Person) -> Bool {
        lhs.name < rhs.name
    }
}

@Observable
class User {
    var persons: [Person]
    
    init() {
        if let decodedData: [Person] = FileManager.default.decode(file: "meetupdata.json") {
            self.persons = decodedData.sorted()
            print("Successfully loaded \(decodedData.count) person(s) from file")
        }
        else {
            self.persons = [Person]()
            print("Starting with empty persons array")
        }
    }
    
    func saveData(newPerson: Person) {
        persons.append(newPerson)
        persons = persons.sorted()
        FileManager.default.encode(data: persons, file: "meetupdata.json")
    }
    
   

    func deleteData(at index: Int) {
        persons.remove(at: index)
        persons = persons.sorted()
        FileManager.default.encode(data: persons, file: "meetupdata.json")
    }
}
