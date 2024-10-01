//
//  Dessert.swift
//  SortingFilteringMenu
//
//  Created by Neslihan Turpcu on 2024-09-30.
//

import Foundation
import CoreData

@objc(Dessert)
class Dessert: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var size: String?
    @NSManaged public var price: NSNumber?
    @NSManaged public var fromCustomer: NSSet?
    
    
    static func consumedByJohnDoe(_ context:NSManagedObjectContext) -> [Dessert]? {
        guard let customer = Customer.with(fullName: "John Doe", context)
        else { return nil }
        
        let request = Dessert.request()
        
        let predicate = NSPredicate(format: "(ANY fromCustomer == %@)", customer)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dessert], results.count > 0
            else { return nil }
            return results
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
}
