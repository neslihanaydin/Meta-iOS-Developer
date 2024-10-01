//
//  Drink+CoreDataProperties.swift
//  CoreDataEntity
//
//  Created by Neslihan Turpcu on 2024-09-25.
//
//

import Foundation
import CoreData


extension Drink {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drink> {
        return NSFetchRequest<Drink>(entityName: "Drink")
    }

    @NSManaged public var brand: String?
    @NSManaged public var name: String?
    @NSManaged public var price: Float
    @NSManaged public var fromLocation: NSSet?
    @NSManaged public var fromCustomer: NSSet?

}

// MARK: Generated accessors for fromLocation
extension Drink {

    @objc(addFromLocationObject:)
    @NSManaged public func addToFromLocation(_ value: Location)

    @objc(removeFromLocationObject:)
    @NSManaged public func removeFromFromLocation(_ value: Location)

    @objc(addFromLocation:)
    @NSManaged public func addToFromLocation(_ values: NSSet)

    @objc(removeFromLocation:)
    @NSManaged public func removeFromFromLocation(_ values: NSSet)

}

// MARK: Generated accessors for fromCustomer
extension Drink {

    @objc(addFromCustomerObject:)
    @NSManaged public func addToFromCustomer(_ value: Customer)

    @objc(removeFromCustomerObject:)
    @NSManaged public func removeFromFromCustomer(_ value: Customer)

    @objc(addFromCustomer:)
    @NSManaged public func addToFromCustomer(_ values: NSSet)

    @objc(removeFromCustomer:)
    @NSManaged public func removeFromFromCustomer(_ values: NSSet)

}

extension Drink : Identifiable {

}
