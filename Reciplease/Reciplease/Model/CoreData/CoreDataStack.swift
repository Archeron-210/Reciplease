
import Foundation
import CoreData

class CoreDataStack {

    // MARK: - Properties

    static let modelName = "Reciplease"

    // MARK: - Singleton

    static var shared = CoreDataStack()

    // MARK: - Public

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    // MARK: - Private

    init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.modelName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo) for : \(storeDescription.description)")
            }
        }
        return container
    }()
}
