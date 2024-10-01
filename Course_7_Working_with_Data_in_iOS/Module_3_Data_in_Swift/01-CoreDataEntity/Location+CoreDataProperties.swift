//
//  Location+CoreDataProperties.swift
//  CoreDataEntity
//
//  Created by Neslihan Turpcu on 2024-09-25.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var address: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var toDrink: NSSet?
    @NSManaged public var toDish: NSSet?
    @NSManaged public var toDessert: NSSet?
    @NSManaged public var fromCustomer: NSSet?

}

// MARK: Generated accessors for toDrink
extension Location {

    @objc(addToDrinkObject:)
    @NSManaged public func addToToDrink(_ value: Drink)

    @objc(removeToDrinkObject:)
    @NSManaged public func removeFromToDrink(_ value: Drink)

    @objc(addToDrink:)
    @NSManaged public func addToToDrink(_ values: NSSet)

    @objc(removeToDrink:)
    @NSManaged public func removeFromToDrink(_ values: NSSet)

}

// MARK: Generated accessors for toDish
extension Location {

    @objc(addToDishObject:)
    @NSManaged public func addToToDish(_ value: Dish)

    @objc(removeToDishObject:)
    @NSManaged public func removeFromToDish(_ value: Dish)

    @objc(addToDish:)
    @NSManaged public func addToToDish(_ values: NSSet)

    @objc(removeToDish:)
    @NSManaged public func removeFromToDish(_ values: NSSet)

}

// MARK: Generated accessors for toDessert
extension Location {

    @objc(addToDessertObject:)
    @NSManaged public func addToToDessert(_ value: Dessert)

    @objc(removeToDessertObject:)
    @NSManaged public func removeFromToDessert(_ value: Dessert)

    @objc(addToDessert:)
    @NSManaged public func addToToDessert(_ values: NSSet)

    @objc(removeToDessert:)
    @NSManaged public func removeFromToDessert(_ values: NSSet)

}

// MARK: Generated accessors for fromCustomer
extension Location {

    @objc(addFromCustomerObject:)
    @NSManaged public func addToFromCustomer(_ value: Customer)

    @objc(removeFromCustomerObject:)
    @NSManaged public func removeFromFromCustomer(_ value: Customer)

    @objc(addFromCustomer:)
    @NSManaged public func addToFromCustomer(_ values: NSSet)

    @objc(removeFromCustomer:)
    @NSManaged public func removeFromFromCustomer(_ values: NSSet)

}

extension Location : Identifiable {

}
