import CoreData
import FirebaseFirestore

/// Получение и сохранение данных
struct DataService {
  
  static func loadItems(_ context: NSManagedObjectContext ) {
    
    // Запрос документов с названием ingredients из Firebase. Querysnapshot - слепок полученных данных
    Firestore.firestore().collection("ingredients").getDocuments { (querySnapshot, error) in
      
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }
      
      // Сохранение данных в локальную БД
      _ = documents.map { queryDocumentSnapshot in
        
        /// Слепок данных полученных из Firebase
        let data = queryDocumentSnapshot.data()
        
        let indicator = data["indicator"] as? String ?? ""
        let obj       = data["object"] as? String ?? ""
        let val       = data["value"] as? String ?? ""
        let doc       = data["document"] as? String ?? ""
        
        /// Модель данных
        let itemModelObject = ItemModelObject(context: context)

        // Пересохранение данных из Firebase в локальную БД
        itemModelObject.doc       = doc
        itemModelObject.indicator = indicator
        itemModelObject.obj       = obj
        itemModelObject.val       = val
       
        do {
          try context.save()
        } catch {
          print("Error")
        }
      }
    }
  }
}
