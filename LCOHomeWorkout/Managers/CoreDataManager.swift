//
//  CoreDataManager.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 09/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    private init() {}
    static let shared = CoreDataManager()
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LCOHomeWorkout")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    lazy var context = persistentContainer.viewContext
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func getFetchRequestEntity<T: NSManagedObject>(describing objectType: T.Type) ->
        NSFetchRequest<NSFetchRequestResult> {
            let entityName = String(describing: objectType)
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            return fetchRequest
    }
//    func fetch<T: NSManagedObject>(_ objectType: T.Type,
//                                   _ predicate: NSPredicate? = nil,
//                                   _ sortDescriptor: NSSortDescriptor? = nil,
//                                   _ fetchLimit: Int? = nil) -> [T] {
//        let fetchRequest = getFetchRequestEntity(describing: objectType)
//        if let fetchLimit = fetchLimit {
//            fetchRequest.fetchLimit = fetchLimit
//        }
//        if let fetchReqPredicate = predicate {
//            fetchRequest.predicate = fetchReqPredicate
//        }
//        if let descriptor = sortDescriptor {
//            fetchRequest.sortDescriptors = [descriptor]
//        }
//        return performFetch(fetchRequest: fetchRequest)
//    }
    
    private func performFetch<T: NSManagedObject>(fetchRequest: NSFetchRequest<NSFetchRequestResult>) -> [T] {
        do {
            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
//            print("\n\nINSTANCE \n\nfetchRequest: \(fetchRequest) \n\n\n fetchedObjects \(fetchedObjects)\n\n\n")

            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
    
    func fetchRecord<T: NSManagedObject>(forEntity entity: T.Type, withId id: Int) -> T? {
        let fetchRequest = getFetchRequestEntity(describing: entity)
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        if let result = performFetch(fetchRequest: fetchRequest).first as? T {
            return result
        }
        return T(context: self.context)
    }
    
//    func getNSManagedObjectRecordsCount<T: NSManagedObject> (describe objectType: T.Type) -> Int? {
//        let fetchRequest = getFetchRequestEntity(describing: objectType)
//        do {
//            let count = try context.count(for: fetchRequest)
//            return count
//        } catch {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
    
}

extension NSManagedObject {
    
    static var context: NSManagedObjectContext {
        return CoreDataManager.shared.context
    }
    
    static func getFetchRequest() ->
        NSFetchRequest<NSFetchRequestResult> {
            let entityName = String(describing: self)
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            return fetchRequest
    }
    
    static var count: Int {
        do {
            let count = try self.context.count(for: self.getFetchRequest())
            return count
        } catch {
            print(error.localizedDescription)
        }
        return 0
    }
    
    static func fetchOrCreate<T: NSManagedObject>(for id: Int) -> T {
        if let exisingRecord = self.fetchRecordById(with: id) {
            return exisingRecord as! T
        }
        return T(context: self.context)
    }
    //===========================
    
    static func fetchRecordById<T: NSManagedObject>(with id: Int) -> T? {
        let fetchRequest = self.getFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
        if let result = performFetch(fetchRequest: fetchRequest).first as? T {
            print("\n\nStatic \n\nfetchRequest: \(fetchRequest) \n\n\n fetchedObjects \(result)\n\n\n")
            return result
        }
        return nil
    }
    
    static func performFetch<T: NSManagedObject>(fetchRequest: NSFetchRequest<NSFetchRequestResult>) -> [T] {
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let fetchedObjects = try self.context.fetch(self.fetchRequest()) as? [T]
            return fetchedObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
}

