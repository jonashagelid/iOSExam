import Foundation
import SwiftUI

struct Fruit: Decodable, Identifiable {
    var id: Int
    var genus: String
    var name: String
    var family: String
    var order: String
    var carbohydrates: Double
    var protein: Double
    var fat: Double
    var calories: Double
    var sugar: Double
}

struct FruitDto: Decodable, Identifiable {
    var genus: String
    var name: String
    var id: Int
    var family: String
    var order: String
    var nutritions: NutrientsDto
}


struct NutrientsDto: Decodable {
    var carbohydrates: Double
    var protein: Double
    var fat: Double
    var calories: Double
    var sugar: Double
}

struct NutritionSummary: Decodable {
    var groupedCarbohydrates: Double?
    var groupedProtein: Double?
    var groupedFat: Double?
    var groupedCalories: Double?
    var groupedSugar: Double?
}

@propertyWrapper
enum FruitFamily: String, CaseIterable {
    case Actinidiaceae
    case Anacardiaceae
    case Bromeliaceae
    case Cactaceae
    case Cucurbitaceae
    case Ericaceae
    case Ebenaceae
    case Grossulariaceae
    case Lauraceae
    case Lythraceae
    case Musaceae
    case Malvaceae
    case Myrtaceae
    case Moraceae
    case Passifloraceae
    case Rosaceae
    case Rutaceae
    case Vitaceae
    case Sapindaceae
    case Solanaceae
    
    var wrappedValue: Color {
        switch self {
        case .Actinidiaceae:
            return Color.red
        case .Anacardiaceae:
            return Color.blue
        case .Bromeliaceae:
            return Color.green
        case .Cactaceae:
            return Color.purple
        case .Cucurbitaceae:
            return Color.brown
        case .Ericaceae:
            return Color.gray
        case .Ebenaceae:
            return Color.black
        case .Grossulariaceae:
            return Color.cyan
        case .Lauraceae:
            return Color.teal
        case .Lythraceae:
            return Color.orange
        case .Musaceae:
            return Color.red.opacity(0.7)
        case .Malvaceae:
            return Color.blue.opacity(0.7)
        case .Myrtaceae:
            return Color.green.opacity(0.7)
        case .Moraceae:
            return Color.black.opacity(0.7)
        case .Passifloraceae:
            return Color.brown.opacity(0.7)
        case .Rosaceae:
            return Color.purple.opacity(0.7)
        case .Rutaceae:
            return Color.blue.opacity(0.4)
        case .Vitaceae:
            return Color.red.opacity(0.4)
        case .Sapindaceae:
            return Color.green.opacity(0.4)
        case .Solanaceae:
            return Color.black.opacity(0.4)
        }
    }
}
