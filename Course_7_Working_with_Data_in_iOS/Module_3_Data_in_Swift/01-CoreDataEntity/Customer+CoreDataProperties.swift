//
//  Customer+CoreDataProperties.swift
//  CoreDataEntity
//
//  Created by Neslihan Turpcu on 2024-09-25.
//
//

import Foundation
import CoreData


extension Customer {

    public static
    func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> =
        NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var fromLocation: NSSet?
    @NSManaged public var toDessert: Dessert?
    @NSManaged public var toDish: Dish?
    @NSManaged public var toDrink: Customer?

}

// MARK: Generated accessors for fromLocation
extension Customer {

    @objc(addFromLocationObject:)
    @NSManaged public func addToFromLocation(_ value: Location)

    @objc(removeFromLocationObject:)
    @NSManaged public func removeFromFromLocation(_ value: Location)

    @objc(addFromLocation:)
    @NSManaged public func addToFromLocation(_ values: NSSet)

    @objc(removeFromLocation:)
    @NSManaged public func removeFromFromLocation(_ values: NSSet)

}

extension Customer : Identifiable {

}
