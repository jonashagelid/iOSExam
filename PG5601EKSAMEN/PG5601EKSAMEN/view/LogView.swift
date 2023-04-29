import Foundation
import SwiftUI
import CoreData

struct LogView: View {
    var fruit: Fruit
    @State public var fruitsList = [Fruit]()
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @SectionedFetchRequest<Date, FruitEntity>(sectionIdentifier: \.created, sortDescriptors: [SortDescriptor(\.created, order: .reverse)])
    private var fruitEntities: SectionedFetchResults<Date, FruitEntity>
    

    
    func formatSectionDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
     
        return dateFormatter.string(from: date)
    }
    
    func buildNutritionSummary(section: SectionedFetchResults<Date, FruitEntity>.Element) -> NutritionSummary {
        var nutritionSummary = NutritionSummary()
        section.forEach{ fruit in
            nutritionSummary.groupedCarbohydrates = (nutritionSummary.groupedCarbohydrates ?? 0) + fruit.carbohydrates
            nutritionSummary.groupedProtein = (nutritionSummary.groupedProtein ?? 0) + fruit.protein
            nutritionSummary.groupedFat = (nutritionSummary.groupedFat ?? 0) + fruit.fat
            nutritionSummary.groupedCalories = (nutritionSummary.groupedCalories ?? 0) + fruit.calories
            nutritionSummary.groupedSugar = (nutritionSummary.groupedSugar ?? 0) + fruit.sugar
        }
        return nutritionSummary
    }
    
    var body: some View {
        Text("Fruits you ate")
        List(fruitEntities) { section in
            
            Section(header: Text("\(formatSectionDate(date: section.id))")) {
                ForEach(section) { fruit in
                    Text(fruit.name)
                }
                NutritionView(nutritionSummary: buildNutritionSummary(section: section))
            }
        }
    }
}
