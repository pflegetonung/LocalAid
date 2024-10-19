import Foundation

struct Organization: Identifiable {
    var id: String
    var name: String
    var description: String
    var username: String
    var contactEmail: String
    var events: [Event]
}
