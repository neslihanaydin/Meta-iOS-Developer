import Foundation
import UIKit

let recipesJSONString = """
[
    {
        "title": "Apple pie",
        "views": 3847,
        "rating": 4.5
    },
    {
        "title": "Boiled egg",
        "views": 10584,
        "rating": 4.9
    },
    {
        "title": "Bacon roll",
        "views": 5847,
        "rating": 3.2
    }
]
"""

struct Recipe: Decodable {
    let title: String
    let rating: Double
    let views: Int
}

let recipesData = Data(recipesJSONString.utf8)
let decoder = JSONDecoder()
let recipes = try! decoder.decode([Recipe].self, from: recipesData)

recipes.forEach {
    print("\($0.title) with a rating of \($0.rating)")
}

// Fetch images

let jsonString = """
    {
        "name": "John",
        "picture": "https://github.com/neslihanaydin/Meta-iOS-Developer/blob/main/Course_5_Create_the_User_Interface_with_SwiftUI/Module_4_Creating_a_SwiftUI_App/Module_4_Final_Project/images/littleLemonLogo.png?raw=true"
    }
"""

struct Profile: Decodable {
    let name: String
    let picture: String
}

let jsonData = Data(jsonString.utf8)
let jsonDecoder = JSONDecoder()
let profile = try! decoder.decode(Profile.self, from: jsonData)

let pictureURL = URL(string: profile.picture)
guard let pictureURL = pictureURL else {
    throw NSError()
}

let request = URLRequest(url: pictureURL)
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data {
        let image = UIImage(data: data)
        print(image)
    }
}

task.resume()

