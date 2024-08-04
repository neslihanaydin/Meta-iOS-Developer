import UIKit


// Working with Strings

let day = "Monday"
print("Today is \(day)")
let hour = 6
let minutes = 30
let period = "PM"

var time = String(hour) + ":" + String(minutes) + " " + period
print("It is \(time)")

print("It is \(time) on \(day)")

let timezone = "PST"

time += " \(timezone)"
print("It is \(time)")
print("It is \(time) on \(day)")

let shortDay = day.prefix(3)
print("Today is \(shortDay).")
print("It is \(time) on \(shortDay)")

day.hasPrefix("M")
day.hasSuffix("day")
day.hasPrefix("m")

let numberPlate = "WW87GP"
for character in numberPlate {
  print("character is = \(character)")
}

// Work with optionals in Swift
/// App that requires a password and a passcode for users to sign in.
/// Use optionals, the forced unwrapping operator, and simple and multiple optional bindings to generate passcodes from passwords
///  and check if the generated passcodes are valid.

var password = "1234"
let passcode = Int(password)

print(passcode!)

password = "hello world"
if let code = Int(password) {
    print(code)
} else {
    print("Invalid passcode!")
}

// Set a default passcode
let accessCode:Int
if let code = Int(password) {
    accessCode = code
} else {
    accessCode = 1111
}

print(accessCode)

// Implement two-factor authentication with passcodes
let firstPassword = "hello"
let secondPassword = "world"

if let firstPasscode = Int(firstPassword), let secondPasscode = Int(secondPassword) {
    print("\(firstPasscode) and \(secondPasscode)")
} else {
    print("Errorr!!!")
}

// Set default passcodes for two-factor authentication
let firstAccessCode:Int
let secondAccessCode:Int

if let firstPasscode = Int(firstPassword), let secondPasscode = Int(secondPassword) {
    firstAccessCode = firstPasscode
    secondAccessCode = secondPasscode
} else {
    firstAccessCode = 1111
    secondAccessCode = 2222
    
}
