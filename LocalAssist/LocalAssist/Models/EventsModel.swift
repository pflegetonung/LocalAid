import Foundation

struct Event: Identifiable {
    var id: String
    var name: String
    var address: String
    var date: Date
    var organizer: User
    var group: CommunityGroup?
    var description: String
    var category: String
    var requiredSkills: String
    var contacts: String
}
