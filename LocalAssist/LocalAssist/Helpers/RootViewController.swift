import SwiftUI
import AuthenticationServices

func getRootViewController() -> UIViewController {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let rootViewController = windowScene.windows.first?.rootViewController else {
        return UIViewController()
    }
    return rootViewController
}
