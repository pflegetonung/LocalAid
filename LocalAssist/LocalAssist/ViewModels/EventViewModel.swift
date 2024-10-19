import Foundation

class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    private let userViewModel = UserViewModel()
    
    init() {
        fetchEvents()
    }
    
    func fetchEvents() {
        let userEcoSam = userViewModel.getUser(byUsername: "@ecoSam")
        let userHelpingHand = userViewModel.getUser(byUsername: "@helpingHand")
        let userAnimalLover = userViewModel.getUser(byUsername: "@animalLover")
        let userEventMakerA = userViewModel.getUser(byUsername: "@eventMakerA")
        let userEventMakerB = userViewModel.getUser(byUsername: "@eventMakerB")
        
        guard let ecoSam = userEcoSam,
              let helpingHand = userHelpingHand,
              let animalLover = userAnimalLover,
              let eventMakerA = userEventMakerA,
              let eventMakerB = userEventMakerB else {
            print("Error: User not found")
            return
        }
        
        let fetchedEvents = [
            Event(
                id: "evt001",
                name: "Park Cleanup Day",
                address: "Golden Gate Park, San Francisco, CA",
                date: Date(),
                organizer: ecoSam,
                group: nil,
                description: "Join us for a community cleanup of Golden Gate Park. Volunteers will pick up litter, plant flowers, and help maintain the park's beauty. All tools and supplies will be provided. Just bring your energy and a willingness to help!",
                category: "Environmental",
                requiredSkills: "Easy – no special skills required.",
                contacts: "contact@ecocleanup.org"
            ),
            Event(
                id: "evt002",
                name: "Recycling Workshop",
                address: "Community Center, San Francisco, CA",
                date: Date(),
                organizer: ecoSam,
                group: nil,
                description: "Learn how to recycle properly and reduce waste in our Recycling Workshop! Volunteers will help set up the workshop, provide information to participants, and assist with activities. No prior knowledge required.",
                category: "Education & Mentorship",
                requiredSkills: "Easy – no special skills required.",
                contacts: "workshop@recycling.org"
            ),
            Event(
                id: "evt003",
                name: "Senior Visit Program",
                address: "Elderly Home, San Mateo, CA",
                date: Date(),
                organizer: helpingHand,
                group: nil,
                description: "Volunteer to visit seniors at the Elderly Home. Your role will include providing companionship, engaging in conversations, and helping with small activities. Compassionate individuals are encouraged to join!",
                category: "Elderly",
                requiredSkills: "Moderate – good communication skills preferred.",
                contacts: "help@seniorcare.org"
            ),
            Event(
                id: "evt004",
                name: "Pet Adoption Fair",
                address: "San Jose Animal Shelter, San Jose, CA",
                date: Date(),
                organizer: animalLover,
                group: nil,
                description: "Help us find loving homes for pets at our Pet Adoption Fair. Tasks include setting up booths, interacting with potential adopters, and assisting with pet handling. Enthusiasm for animals is a must!",
                category: "Pets",
                requiredSkills: "Moderate – some animal handling experience preferred.",
                contacts: "adopt@petshelter.org"
            ),
            Event(
                id: "evt005",
                name: "Animal Shelter Support",
                address: "Pet Shelter, San Jose, CA",
                date: Date(),
                organizer: animalLover,
                group: nil,
                description: "Assist in caring for animals at the shelter and help with daily operations. Duties include feeding, cleaning, and socializing with animals. Volunteers should be ready for some physical work.",
                category: "Pets",
                requiredSkills: "Moderate – physical fitness required.",
                contacts: "support@petshelter.org"
            ),
            Event(
                id: "evt006",
                name: "Tree Planting Event",
                address: "Los Gatos, CA",
                date: Date(),
                organizer: eventMakerA,
                group: nil,
                description: "Join us in planting trees to enhance the beauty of Los Gatos. Volunteers will dig holes, plant saplings, and water them. All tools will be provided, but volunteers should wear comfortable clothing.",
                category: "Environmental",
                requiredSkills: "Easy – no special skills required.",
                contacts: "trees@planting.org"
            ),
            Event(
                id: "evt007",
                name: "Home Visits for the Elderly",
                address: "Various locations, Cupertino, CA",
                date: Date(),
                organizer: eventMakerB,
                group: nil,
                description: "Provide companionship and support through home visits for the elderly in Cupertino. Volunteers will visit assigned individuals, help with small tasks, and provide social interaction.",
                category: "Elderly",
                requiredSkills: "Moderate – experience with elderly care preferred.",
                contacts: "visits@elderlysupport.org"
            )
        ]
        
        self.events = fetchedEvents
    }
}
