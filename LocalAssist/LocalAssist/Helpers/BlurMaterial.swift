import Foundation
import SwiftUI

public class CustomBlur {
    struct Blur: UIViewRepresentable {
        var style: UIBlurEffect.Style
        
        func makeUIView(context: Context) -> UIVisualEffectView {
            UIVisualEffectView(effect: UIBlurEffect(style: style))
        }
        
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
    }
}
