
import SwiftUI

struct ContentView: View {
    @StateObject var apiFetcher = ApiFetcher()

    
    var body: some View {
        
            if apiFetcher.isLoading {
                LoadingView()
            } else if apiFetcher.errorMsg != nil {
                ErrorView(apiFetcher: ApiFetcher())
            } else {
                AllFruitsView(fruits: apiFetcher.fruits)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
