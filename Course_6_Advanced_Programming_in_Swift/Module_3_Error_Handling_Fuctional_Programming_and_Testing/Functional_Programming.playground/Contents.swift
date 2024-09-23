import UIKit

// Map
struct User {
    let id: Int
    let name: String
    let languages: [String]
}

let users = [
    User(id: 1, name: "John", languages: ["English", "German"]),
    User(id: 2, name: "Tom", languages: ["Russian", "Spanish"])
]

let usersIds = users.map{ user in
    return user.id
}
print(usersIds)

let usersIdsShorter = users.map { $0.id }
print(usersIdsShorter)

// Compact Map
// discards any nil values
let possibleNumbers = ["1", "2", "three", "///4///", "5"]
let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
// [1, 2, nil, nil, 5]
let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
// [1, 2, 5]

// Flat map
// The mapping closure returns an array of elements rather than just a single element
// note that languages in the user class is an array type
// This results in a single array containing all the languages of all the users. If the output is printed to the console, it would be a single dimension array rather than an array of arrays as indicated below.
let allLanguages = users.flatMap { $0.languages }

// Filter
struct Article {
    let title: String
    let isPublished: Bool
}

let articles = [
    Article(title: "Breaking news", isPublished: true),
    Article(title: "Local news", isPublished: true),
    Article(title: "Unconfirmed", isPublished: false),
]

let unpublishedArticles = articles.filter { $0.isPublished == false }

// Reduce
/*
 let numbers = [1, 4, 65, 3, -1]
 var sum = 0

 for i in numbers {
     sum += i
 }
 */

var numbers = [1, 4, 65, 3, -1]
let sum = numbers.reduce(0) { $0 + $1 }

// Exercise
// Get total revenute for a specific location
struct Order {
    let price: Int
    let location: String
}

func totalRevenueOf(orders: [Order], location: String) -> Int {
    let ordersAtLocation = orders.filter { $0.location == location }
    print(ordersAtLocation)
    let orderPrices = ordersAtLocation.map { $0.price }
    print(orderPrices)
    let totalRevenueOf = orderPrices.reduce(0) { $0 + $1 }
    return totalRevenueOf
}

let orders = [
    Order(price: 24, location: "New York"),
    Order(price: 37, location: "San Francisco"),
    Order(price: 101, location: "New York"),
]
 
let result = totalRevenueOf(orders: orders, location: "New York")
print(result)

// forEach
orders.forEach { order in
        print(order)
}

let donationsInformation = ["John": 56, "Tom": 27, "Charlie": 23]
donationsInformation.map { "\($0.key) has donated \($0.value) so far" }
    .forEach { print($0) }

