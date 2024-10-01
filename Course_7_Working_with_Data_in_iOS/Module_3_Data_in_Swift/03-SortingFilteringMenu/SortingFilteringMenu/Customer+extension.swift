//
// Customer+extension.swift



import Foundation
import CoreData


extension Customer {
    
    public static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }
    
    class func deleteAll(_ context:NSManagedObjectContext) {
        let request = Customer.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        deleteRequest.resultType = .resultTypeObjectIDs
        
        do {
            
            let delete = try context.execute(deleteRequest) as? NSBatchDeleteResult
            
            guard let deleteResult = delete?.result as? [NSManagedObjectID]
            else { return }
            
            let deletedObjects: [AnyHashable: Any] = [NSDeletedObjectsKey: deleteResult]
            
            NSManagedObjectContext.mergeChanges(
                fromRemoteContextSave: deletedObjects,
                into: [context]
            )
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}


