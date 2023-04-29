import Foundation

class ApiFetcher: ObservableObject {
    @Published var fruits = [Fruit]()
    @Published var errorMsg: String? = nil
    @Published var isLoading: Bool = false
    
    init() {
        fetchFruits()
    }
    
    func fetchFruits(){
        isLoading = true
        
        let url = URL(string: "https://www.fruityvice.com/api/fruit/all")!
        
        let task = URLSession.shared.dataTask(with: url) {[unowned self] (data, response, error) in
            DispatchQueue.main.async {
                isLoading = false
            }
            let fruitDecoder  = JSONDecoder()
            if let data = data {
                
            do {
                let fruits = try fruitDecoder.decode([FruitDto].self, from: data)
                print(fruits)
                DispatchQueue.main.async {
                    self.fruits = fruits.map({ self.mapDto(dto: $0) })
                    
                }
            } catch {
                print(error)
            }
        }
    }
    task.resume()
}
    func mapDto(dto: FruitDto) -> Fruit {
        return Fruit(id: dto.id, genus: dto.genus, name: dto.name, family: dto.family, order: dto.order, carbohydrates: dto.nutritions.carbohydrates, protein: dto.nutritions.protein, fat: dto.nutritions.fat, calories: dto.nutritions.fat, sugar: dto.nutritions.sugar)
    }
}

