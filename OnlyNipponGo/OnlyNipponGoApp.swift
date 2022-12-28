import SwiftUI
import Firebase
import GoogleSignIn
import AppTrackingTransparency

@main
struct OnlyNipponGoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AccountExistViewModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        requestIDFA()
        
        FirebaseApp.configure()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    func requestIDFA() {
        if #available(iOS 15, *) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
              ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                  print(status.rawValue)
              })
            }
            
        } else {
            
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
              // Tracking authorization completed. Start loading ads here.
              // loadAd()
            })
            
        }
    }
}

