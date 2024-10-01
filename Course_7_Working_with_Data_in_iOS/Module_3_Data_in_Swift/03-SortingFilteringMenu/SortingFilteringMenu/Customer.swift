//
//  Customer.swift
//  SortingFilteringMenu
//
//  Created by Neslihan Turpcu on 2024-09-30.
//

import Foundation
import CoreData

@objc(Customer)
class Customer : NSManagedObject {
    
    @NSManaged public var fullName: String?
    @NSManaged public var email: String?
    @NSManaged public var toDessert: NSSet?
    
    static func with(fullName: String, _ context:NSManagedObjectContext) -> Customer? {
        let request = Customer.request()
        
        let predicate = NSPredicate(format: "(fullName CONTAINS [cd] %@)", fullName)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Customer], results.count > 0 
            else {
                return nil
            }
            return results.first
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
}
