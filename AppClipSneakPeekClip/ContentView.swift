import SwiftUI
import IBMMobileFirstPlatformFoundation

struct ContentView: View {
    @Binding var name: String
    
    
    
    var body: some View {
        
        Text("Hello, \(name)").padding();
        Button("Click Me", action: {
            print("Hello World tapped!")
            
            let request = WLResourceRequest(url: URL(string: "/adapters/ResourceAdapter/balance"), method: WLHttpMethodGet)
            request?.send { (response, error) -> Void in
                if(error == nil){
                    print((response?.responseText)!)
                    let alert = UIAlertController(title: "Balance",
                        message: (response?.responseText)!,
                        preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) -> Void in
                    }))
                    DispatchQueue.main.async {
                        let topController = UIApplication.shared.keyWindow!.rootViewController! as UIViewController
                        topController.present(alert,
                            animated: true,
                            completion: nil)
                    }
                }
                else{
                    print(error.debugDescription)
                }
            }
            
        })
    }
}
