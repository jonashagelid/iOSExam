import Foundation
import SwiftUI

struct NutritionView: View {
    var nutritionSummary: NutritionSummary
    
    let formatter = NumberFormatter()
    func formatDouble(number: Double) -> String {
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        return formatter.string(for: number) ?? ""
    }
    var body: some View {
        Text("Sugar \(formatDouble(number: nutritionSummary.groupedSugar!))")
        Text("Calories \(formatDouble(number: nutritionSummary.groupedCalories!))")
        Text("Fat \(formatDouble(number: nutritionSummary.groupedFat!))")
        Text("Protein \(formatDouble(number: nutritionSummary.groupedProtein!))")
        Text("Carbohydrates \(formatDouble(number: nutritionSummary.groupedCarbohydrates!))")
    }
}
