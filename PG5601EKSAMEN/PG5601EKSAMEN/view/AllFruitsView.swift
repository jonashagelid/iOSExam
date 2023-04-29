
import Foundation
import SwiftUI


struct AllFruitsView: View {
    let fruits: [Fruit]
    var body: some View {
        NavigationView{
            List{
                Text("All fruits")
                Section{
                    ForEach(fruits){
                        fruit in
                        HStack{
                            NavigationLink(destination: FruitDetailView(fruit: fruit)){
                                Rectangle()
                                    .fill(FruitFamily(rawValue: fruit.family)?.wrappedValue ?? .blue)
                                    .frame(width: 35, height: 35)
                                Text(fruit.name)
                            }
                        }
                    }
                }
            }
        }
    }
}


/*struct AllFruitsView_Previews: PreviewProvider {
 static var previews: some View {
 AllFruitsView(fruits: [Any])
 }
 }*/
