//
//  Person.swift
//  MeetUp
//
//  Created by Deepankar Das on 27/11/25.
//

import Foundation
import MapKit
import UIKit

struct Person: Codable, Identifiable, Comparable {
    var id = UUID()
    var name: String
    var personImage: Data
    var date = Date().formatted(date: .abbreviated, time: .omitted)
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
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
