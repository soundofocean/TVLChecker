import SwiftUI

struct MainView: View {
  
  /// Параметр, который пригодится для работы с БД
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(entity: ItemModelObject.entity(), sortDescriptors: []) private var items: FetchedResults<ItemModelObject>
  
  @State var indicator: String
  
  var body: some View {
    
    NavigationView {
      
      Form {
        Section (header: Text("Choose indicator")) {
          TextField("Choose indicator", text: $indicator)
          
        }
        
        List(items, id: \.self) { item in
          Text(item.indicator ?? "some")
       
          NavigationLink(destination: ItemView()) {}
        }
      }
    }
    .navigationBarTitle("Result", displayMode: .inline)
  }
}

