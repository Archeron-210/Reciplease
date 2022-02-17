
import Foundation
@testable import Reciplease
import CoreData

class CoreDataTestStack : CoreDataStackProtocol {

    // MARK: - Public

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Private

    private static let modelName = "Reciplease"

    private lazy var persistentContainer: NSPersistentContainer = {
        // Creating an in-memory persitent store :
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        // Creating an instance of NSPersistentContainer wich is passed the model name :
        let container = NSPersistentContainer(name: CoreDataTestStack.modelName)

        // Assigning the in-memory peristent store to the container :
        container.persistentStoreDescriptions = [persistentStoreDescription]
        container.loadPersistentStores { _, error in
          if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
          }
        }
        return container
    }()
}
