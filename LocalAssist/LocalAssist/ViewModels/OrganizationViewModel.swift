import Foundation

class OrganizationViewModel: ObservableObject {
    @Published var organizations: [Organization] = []
    
    init() {
        fetchOrganizations()
    }
    
    func fetchOrganizations() {
        let fetchedOrganizations = [
            Organization(id: "org001", name: "GreenWorld Foundation", description: "Promotes sustainable practices and eco-friendly events.", username: "@greenwrld", contactEmail: "contact@greenworld.org", events: []),
            Organization(id: "org002", name: "CareCompanions", description: "Supports elderly citizens through volunteer programs.", username: "@care", contactEmail: "info@carecompanions.com", events: []),
            Organization(id: "org003", name: "Pet Rescue Inc.", description: "Dedicated to animal rescue and adoption services.", username: "@petrescue", contactEmail: "rescue@petrescue.org", events: []),
            Organization(id: "org004", name: "FeedTheHungry", description: "Fighting hunger with food distribution events.", username: "@feedthehungry", contactEmail: "support@feedthehungry.org", events: []),
            Organization(id: "org005", name: "Parks4All", description: "Improving parks and public spaces through volunteer efforts.", username: "@parks4all", contactEmail: "info@parks4all.org", events: [])
        ]
        
        self.organizations = fetchedOrganizations
    }
    
    func getOrganization(byUsername username: String) -> Organization? {
        return organizations.first { $0.username == username }
    }
}
