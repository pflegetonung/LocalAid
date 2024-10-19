import Foundation

class CommunityGroupViewModel: ObservableObject {
    @Published var groups: [CommunityGroup] = []
    private let userViewModel = UserViewModel()
    private let eventViewModel = EventViewModel()
    
    init() {
        fetchGroups()
    }
    
    func fetchGroups() {
        let userEcoSam = userViewModel.getUser(byUsername: "@ecoSam")
        let userHelpingHand = userViewModel.getUser(byUsername: "@helpingHand")
        let userAnimalLover = userViewModel.getUser(byUsername: "@animalLover")
        let userGreenJane = userViewModel.getUser(byUsername: "@greenJane")
        let userParkRanger = userViewModel.getUser(byUsername: "@parkRanger")
        let userCaregiverJake = userViewModel.getUser(byUsername: "@caregiverJake")
        let userNurseMia = userViewModel.getUser(byUsername: "@nurseMia")
        let userVetCare = userViewModel.getUser(byUsername: "@vetCare")
        let userPetHelper = userViewModel.getUser(byUsername: "@petHelper")
        
        let events = eventViewModel.events
        let event001 = events.first { $0.id == "evt001" }
        let event002 = events.first { $0.id == "evt002" }
        let event003 = events.first { $0.id == "evt003" }
        let event004 = events.first { $0.id == "evt004" }
        let event005 = events.first { $0.id == "evt005" }
        
        guard let ecoSam = userEcoSam,
              let helpingHand = userHelpingHand,
              let animalLover = userAnimalLover,
              let greenJane = userGreenJane,
              let parkRanger = userParkRanger,
              let caregiverJake = userCaregiverJake,
              let nurseMia = userNurseMia,
              let vetCare = userVetCare,
              let petHelper = userPetHelper,
              let evt001 = event001,
              let evt002 = event002,
              let evt003 = event003,
              let evt004 = event004,
              let evt005 = event005 else {
            print("Error: Users or Events not found")
            return
        }
        
        let fetchedGroups = [
            CommunityGroup(
                id: "grp001",
                name: "Clean Earth Volunteers",
                description: "Dedicated to local park cleanups and eco-friendly activities.",
                members: [ecoSam, greenJane, parkRanger],
                leader: ecoSam,
                location: "San Francisco, CA",
                cause: "Environment",
                events: [evt001, evt002]
            ),
            CommunityGroup(
                id: "grp002",
                name: "Elderly Care Helpers",
                description: "Providing support for elderly citizens through companionship and assistance.",
                members: [helpingHand, caregiverJake, nurseMia],
                leader: helpingHand,
                location: "Austin, TX",
                cause: "Elderly Support",
                events: [evt003]
            ),
            CommunityGroup(
                id: "grp003",
                name: "Animal Rescue Heroes",
                description: "Rescuing and caring for abandoned pets in the local community.",
                members: [animalLover, vetCare, petHelper],
                leader: animalLover,
                location: "Seattle, WA",
                cause: "Animal Rescue",
                events: [evt004, evt005]
            )
        ]
        
        self.groups = fetchedGroups
    }
}
