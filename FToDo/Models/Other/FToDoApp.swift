import FirebaseCore
import SwiftUI

@main
struct FToDoApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
           MainView()
        }
    }
}
