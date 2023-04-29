import Foundation
import CoreData


extension FruitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FruitEntity> {
        return NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
    }

    @NSManaged public var id: Int16
    @NSManaged public var genus: String
    @NSManaged public var order: String
    @NSManaged public var family: String
    @NSManaged public var name: String
    @NSManaged public var fat: Double
    @NSManaged public var protein: Double
    @NSManaged public var carbohydrates: Double
    @NSManaged public var sugar: Double
    @NSManaged public var calories: Double
    @NSManaged public var created: Date

}

extension FruitEntity : Identifiable {

}
