//
//  Persistence.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 30/12/21.
//

import CoreData

class Persistence {

    static var shared = Persistence()

    var context: NSManagedObjectContext {
        self.persistentContainer.viewContext
    }

    private init() {}

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FinanceModel")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
