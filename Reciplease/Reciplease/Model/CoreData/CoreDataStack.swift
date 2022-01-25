
import Foundation
import CoreData

protocol CoreDataStackProtocol {
    var viewContext: NSManagedObjectContext { get }
}

class CoreDataStack: CoreDataStackProtocol {

    // MARK: - Public

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Private

    private static let modelName = "Reciplease"

    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.modelName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo) for : \(storeDescription.description)")
            }
        }
        return container
    }()
}
