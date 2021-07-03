import Foundation
import CoreData

extension ItemModelObject {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemModelObject> {
    return NSFetchRequest<ItemModelObject>(entityName: "ItemModelObject")
  }

  @NSManaged public var indicator: String?
  @NSManaged public var val: String?
  @NSManaged public var obj: String?
  @NSManaged public var doc: String?
  
}

extension ItemModelObject : Identifiable {}
