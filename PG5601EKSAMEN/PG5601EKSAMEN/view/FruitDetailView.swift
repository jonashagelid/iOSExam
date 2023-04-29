
import Foundation
import SwiftUI
import CoreData


struct FruitDetailView: View{

    var fruit: Fruit
    @Environment(\.managedObjectContext) var managedObjectContext
    let persistenceController = PersistenceController.shared

    
    
    @State var highSugar = false
    @State var sugarWarning = false
    @State private var date = Date()
    
    func sugarChecker(){
        if fruit.sugar >= 10{
            highSugar = true
            sugarWarning = true
            print(fruit)
            print(sugarWarning)
        }
    }
    
    func addFruit(date: Date) {
        
        
        let now = date
        
        let entity = FruitEntity(context: managedObjectContext)
        entity.id = Int16(fruit.id)
        entity.genus = fruit.genus
        entity.name = fruit.name
        entity.family = fruit.family
        entity.order = fruit.order
        entity.carbohydrates = fruit.carbohydrates
        entity.protein = fruit.protein
        entity.fat = fruit.fat
        entity.calories = fruit.calories
        entity.sugar = fruit.sugar
        entity.created = now
        
        PersistenceController.shared.save()
    }
    
    
    let numberFormatter = NumberFormatter()
    func formatDouble(number: Double) -> String {
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number) ?? ""
    }
    
    private func animateColor(){
        if highSugar {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            withAnimation(
                .easeInOut
                .repeatForever()
                    .speed(0.2)
                ){
                    
                self.highSugar.toggle()
                    print(sugarWarning)
                    print(highSugar)
                }
            })
        }
    }


    
    var body: some View {
        ZStack{
            VStack{
                Section{
                    Text("Name: \(fruit.name) \n Family: \(fruit.family) \n Genus: \(fruit.genus) \n Order: \(fruit.order)")
                    Text("Nutrition: ")
                    if sugarWarning == true {
                        Text("Warning: High sugar content!")
                    }
                    Text("Sugar: \(formatDouble(number: fruit.sugar)) \n Carbohydrates: \(formatDouble(number: fruit.carbohydrates)) \n Protein: \(formatDouble(number: fruit.protein)) \n Calories: \(formatDouble(number: fruit.calories)) \n Fat: \(formatDouble(number: fruit.fat))")
                }
                
                Text("Eat this fruit!")
                    
                DatePicker("", selection: $date)
                            .padding()
                Button("Loggfør"){
                    addFruit(date: date)
                
                }
                VStack{
                    NavigationLink(destination: LogView(fruit: fruit)){
                    Text("Go to log")
                    }.padding()
                }
            }
        }.onAppear{
            sugarChecker()
            animateColor()
        }
        .background(highSugar ? Color.red : Color.white)
            .edgesIgnoringSafeArea(.all)
            .padding()
    }
}

/*struct FruitDetailView_Previews{
    static var previews: some View {
        FruitDetailView(fruit: Fruit.)
    }
}*/
