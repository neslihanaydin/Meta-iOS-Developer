//
//  Dish+CoreDataClass.swift
//  CoreDataEntity
//
//  Created by Neslihan Turpcu on 2024-09-25.
//
//

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {

   // let customer = Customer.with(firstName: "John", lastName: "Doe", viewContext)

    static func fromCustomer(customer: Customer, _ context:NSManagedObjectContext) -> [Dish]? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "(ANY fromCustomer == %@)", customer)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish],
                  results.count > 0
            else { return nil }
            return results
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
}
