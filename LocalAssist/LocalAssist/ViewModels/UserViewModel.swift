import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        let fetchedUsers = [
            User(id: "usr001", name: "Sam Green", username: "@ecoSam", status: "Event Organizer"),
            User(id: "usr002", name: "Jane Doe", username: "@greenJane", status: "Volunteer"),
            User(id: "usr003", name: "Mike Ranger", username: "@parkRanger", status: "Volunteer"),
            User(id: "usr004", name: "Lilly Heart", username: "@helpingHand", status: "Event Organizer"),
            User(id: "usr005", name: "Jake Strong", username: "@caregiverJake", status: "Volunteer"),
            User(id: "usr006", name: "Mia Wells", username: "@nurseMia", status: "Volunteer"),
            User(id: "usr007", name: "Lucas Brown", username: "@animalLover", status: "Event Organizer"),
            User(id: "usr008", name: "Dr. Amy Vet", username: "@vetCare", status: "Volunteer"),
            User(id: "usr009", name: "Cathy Wilson", username: "@petHelper", status: "Volunteer"),
            User(id: "usr010", name: "Tom Builder", username: "@eventMakerA", status: "Event Organizer"),
            User(id: "usr011", name: "Sophia Clark", username: "@eventMakerB", status: "Event Organizer")
        ]
        
        self.users = fetchedUsers
    }
    
    func getUser(byUsername username: String) -> User? {
        return users.first { $0.username == username }
    }
}
