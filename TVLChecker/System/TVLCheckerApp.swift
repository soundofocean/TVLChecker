import Firebase
import SwiftUI

@main
struct TVLCheckerApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        
        // Добавление значения viewContext по ключу managedObjectContext в словарь Environment
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
  }
  
  // Первым запускается инициализатор
  init() {
    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!)
    
    // Метод настройки
    FirebaseApp.configure()
    
    DataService.loadItems(persistenceController.container.viewContext)
  }
}
