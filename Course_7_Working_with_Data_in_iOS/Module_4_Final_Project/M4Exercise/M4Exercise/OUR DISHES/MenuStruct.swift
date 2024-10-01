import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

struct MenuItem: Codable, Identifiable {
    let id = UUID()
    let title: String
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
    }
}
