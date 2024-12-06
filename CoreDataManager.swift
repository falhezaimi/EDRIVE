import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EDRIVEDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data Store failed: \(error)")
            }
        }
        return container
    }()

    func saveUserProfile(name: String, points: Int) {
        let context = persistentContainer.viewContext
        let user = User(context: context)
        user.name = name
        user.points = Int32(points)

        do {
            try context.save()
        } catch {
            print("Failed to save user: \(error)")
        }
    }
}
