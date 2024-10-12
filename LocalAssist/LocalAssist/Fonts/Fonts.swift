import SwiftUI

extension Font {
    static func montserrat(size: CGFloat, weight: String = "Regular") -> Font {
        return Font.custom("Montserrat-\(weight)", size: size)
    }
}
