import SwiftUI

struct MainView: View {
  
  /// Параметр, который пригодится для работы с БД
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(entity: ItemModelObject.entity(), sortDescriptors: []) private var items: FetchedResults<ItemModelObject>
  
  var body: some View {
    List(items, id: \.self) { item in
      Text(item.val ?? "some")
    }
  }
}

