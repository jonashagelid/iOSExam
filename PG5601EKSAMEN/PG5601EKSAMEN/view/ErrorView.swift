

import Foundation
import SwiftUI

struct ErrorView: View {
    @ObservedObject var apiFetcher: ApiFetcher
    var body: some View{
        Text("Error")
    }
}

struct ErrorView_Previews: PreviewProvider{
    static var previews: some View{
        ErrorView(apiFetcher: ApiFetcher())
    }
}
