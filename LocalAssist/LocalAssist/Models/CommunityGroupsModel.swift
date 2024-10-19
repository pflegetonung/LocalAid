import Foundation

struct CommunityGroup: Identifiable {
    var id: String
    var name: String
    var description: String
    var members: [User]
    var leader: User
    var location: String?
    var cause: String
    var events: [Event]
}
