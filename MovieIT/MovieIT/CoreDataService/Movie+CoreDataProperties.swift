//
//  Movie+CoreDataProperties.swift
//  MovieIT
//
//  Created by Caio Mandarino on 10/11/25.
//
//

public import Foundation
public import CoreData


public typealias MovieCoreDataPropertiesSet = NSSet

extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: Data?
    @NSManaged public var movieDescription: String?
    @NSManaged public var gender: String?
    @NSManaged public var realeseDate: Date?

    var unwrappedName: String {
        name ?? ""
    }
    
    var unwrappedDescription: String {
        movieDescription ?? ""
    }
    
    var unwrappedGender: String {
        gender ?? ""
    }
    
    var unwrappedReleaseDate: Date {
        realeseDate ?? Date()
    }
    
}

extension Movie : Identifiable {

}
