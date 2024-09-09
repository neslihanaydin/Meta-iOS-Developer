import UIKit

var pastaTypesSet = Set<String>()
var pastaTypesArray = [String]()

// Insert Method
pastaTypesSet.insert("Tagliatelle")
pastaTypesSet.insert("Fettuccine")
pastaTypesSet.insert("Spaghetti")
pastaTypesSet.insert("Linguine")

print(pastaTypesSet) // unordered-> ["Fettuccine", "Tagliatelle", "Spaghetti", "Linguine"]
print(pastaTypesSet.count)

pastaTypesSet.insert("Linguine")
pastaTypesSet.insert("Linguine2")

print(pastaTypesSet) // unordered-> ["Fettuccine", "Tagliatelle", "Linguine2", "Spaghetti", "Linguine"]
print(pastaTypesSet.count)

// Remove Method
pastaTypesSet.remove("Linguine2")
print(pastaTypesSet)
print(pastaTypesSet.count)

// Union Method
var pastaTypesSet2 = Set<String>()
pastaTypesSet2.insert("Tortellini")
pastaTypesSet2.insert("Ziti")
pastaTypesSet2.insert("Tagliatelle")
pastaTypesSet2.insert("Lasagna")

let pastaSetUnion = pastaTypesSet.union(pastaTypesSet2)
print(pastaSetUnion)
print(pastaSetUnion.count)

// Intersection Method
let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
let bothNeighborsAndEmployees = employees.intersection(neighbors)
print(bothNeighborsAndEmployees)
// Prints "["Bethany", "Eric"]"

// Contains
print("Eric is in the set: \(bothNeighborsAndEmployees.contains("Eric"))")

// Exercise : Table Reservations
// Declare sets for reach booking method
let reservationsInPerson: Set = ["000-345-3441","000-345-3442"]
let reservationsOverPhone: Set = ["000-345-6223","000-345-7223"]
let reservationsOverInternet: Set = ["000-345-3443","000-345-5223"]

// Combine all the sets into a single set
let inPersonAndOverPhone = reservationsInPerson.union(reservationsOverPhone)
print(inPersonAndOverPhone)

var allPhoneNumbers = inPersonAndOverPhone.union(reservationsOverInternet)
print(allPhoneNumbers)

// Create a Set for the reservation codes
var confirmationCodes: Set = ["LL3450", "LL3451", "LL3452", "LL3453", "LL3454",]
print("Number of confirmation codes: \(confirmationCodes.count), Number of all phone numbers: \(allPhoneNumbers.count)")

confirmationCodes.insert("LL3455")
print("Number of confirmation codes: \(confirmationCodes.count), Number of all phone numbers: \(allPhoneNumbers.count)")

confirmationCodes.remove("LL3455")
allPhoneNumbers.remove("000-345-3443")
print("Number of confirmation codes: \(confirmationCodes.count), Number of all phone numbers: \(allPhoneNumbers.count)")

// Recap in enums
enum Week: Int, CaseIterable {
  case Monday = 1
  case Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

for day in Week.allCases {
  print("\(day) is day \(day.rawValue) of the week")
}

enum PastaTypes: Int {
    case spaghetti
    case penne
    case ravioli
    case rigatoni
}

print(PastaTypes.penne.rawValue)



