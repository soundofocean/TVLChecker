import SwiftUI

/// Модель данных объекта
struct Item: Identifiable, Equatable {
  var id: String = UUID().uuidString
  var indicator: String
  var obj: String
  var val: String
  var doc: String
}
