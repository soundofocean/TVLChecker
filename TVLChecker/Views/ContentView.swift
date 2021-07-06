import CoreData
import SwiftUI


struct ContentView: View {
  
  @Environment(\.managedObjectContext) private var viewContext
  
  @State private var indicator: String = " "
  
  var body: some View {
    MainView(indicator: indicator)
  }
}


