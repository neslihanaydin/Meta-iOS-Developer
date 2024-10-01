//
//  Customer+CoreDataClass.swift
//  CoreDataEntity
//
//  Created by Neslihan Turpcu on 2024-09-25.
//
//

import Foundation
import CoreData

@objc(Customer)
public class Customer: NSManagedObject {
    
    static func with(firstName: String,
                     lastName: String,
                     _ context:NSManagedObjectContext) -> Customer? {
        let request = Customer.request()
        let predicate = NSPredicate(format: "firstName == %@ AND lastName == %@", firstName, lastName) // filter
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Customer], results.count > 0
            else { return nil }
            return results.first
        } catch (let error) {
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func delete(with firstName: String = "John", lastName: String = "Doe", _ context: NSManagedObjectContext) -> Bool {
        let request = Customer.request()
        let predicate = NSPredicate(format: "firstName == %@ AND lastName == $@", firstName, lastName)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Customer], results.count == 1
            else {
                return false
            }
            context.delete(results.first ?? Customer())
            return true
        } catch (let error) {
            print(error.localizedDescription)
            return false
        }
    }
    
    class func deleteAll(_ context: NSManagedObjectContext) {
        let request = Customer.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistentStoreCoordinator = context.persistentStoreCoordinator
            else { return }
            
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
}
