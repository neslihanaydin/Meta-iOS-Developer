import UIKit

// Example: Tracking goldBars for a pirate
/*
var goldBars = 0

func unlockTreasureChest(inventory: Int)->Int {
   // return inventory + 100
    inventory + 100 // return an expression implicitly
}

goldBars = unlockTreasureChest(inventory: goldBars)
goldBars = unlockTreasureChest(inventory: goldBars)
goldBars = unlockTreasureChest(inventory: goldBars)



// dev b: "What does this code mean?"
// dev a: "I don't remember..."

//  'by' is argument label, help us to read functions more speaking language.
var goldBars = 0
func incrementInventory(_ inventory: inout Int, by amount: Int = 100){
  inventory += amount
}

incrementInventory(&goldBars)
print(goldBars)
incrementInventory(&goldBars)
print(goldBars)
incrementInventory(&goldBars)
print(goldBars)
incrementInventory(&goldBars, by: 300)
print(goldBars)
incrementInventory(&goldBars, by: 50)
print(goldBars)
 */

/*
// Closures

// simple closures
var aClosure = {
    () -> Void in
    print("This is a closure")
}
aClosure()

// passing an argument to a closure
var argumentClosure = {
    (str: String) -> Void in
    print("Hello \(str)")
}
argumentClosure("Neslihan")

// passing an argument and returning a value to a closure
var max = {
    (num1: Int, num2: Int) -> Int in
    return num1 > num2 ? num1 : num2
}
max(43,67)

// passing a closure as a function argument
let letters = ["H" , "E" , "X" , "A"]
let myCollection = letters.sorted(by: { (string1: String, string2: String) -> Bool in return string1 < string2 } )
print(myCollection)

// Practice using closures
var goldBars = 0
//let unlockTreasureChest = { (inventory: Int) -> Int in return inventory + 100}
//print(unlockTreasureChest(100))

let unlockTreasureChest = { ( inventory: inout Int) in inventory += 100}

unlockTreasureChest(&goldBars)
print(goldBars)
*/

// Using function and closures together
// After spending the gold bars, players want to be notified on the remaining gold bars.
var goldBars = 100
// A closure expression written in a function's final parameter is called trailing closure.
func spendTenGoldBars(from inventory: inout Int, completion: (Int) -> Void) {
    inventory -= 10
    completion(inventory)
}

print("You had \(goldBars) gold bars.")
spendTenGoldBars(from: &goldBars) { goldBars in
    print("You spent ten gold bars.")
    print("You have \(goldBars) gold bars.")
}

spendTenGoldBars(from: &goldBars, completion: { goldBars in
    print("You spent ten gold bars.")
    print("You have \(goldBars) gold bars.")
})

func spendTenGoldBarsControlled(from inventory: inout Int, completion: (Int) -> Void, onFailure: () -> Void) {
    if inventory - 10 > 0 {
        inventory -= 10
        completion(inventory)
    } else {
        onFailure()
    }
}

for x in 1...10 {
    spendTenGoldBarsControlled(from: &goldBars) { goldBars in
        print("You spent ten gold bars.")
        print("You have \(goldBars) gold bars.")
    } onFailure: {
        print("You don't have enough gold bars.")
    }
}

// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/closures/#Trailing-Closures
// Trailing Closures example with map
/* convert an array of Int values into an array of String values. 
   The array [16, 58, 510] is used to create the new array ["OneSix", "FiveEight", "FiveOneZero"]:
*/

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

// Capturing Values
/*
 In Swift, the simplest form of a closure that can capture values is a nested function, 
 written within the body of another function. A nested function can capture any of its
 outer function’s arguments and can also capture any constants and variables defined
 within the outer function.
 Here’s an example of a function called makeIncrementer, which contains a nested function 
 called incrementer. The nested incrementer() function captures two values, runningTotal
 and amount, from its surrounding context. After capturing these values, incrementer
 is returned by makeIncrementer as a closure that increments runningTotal by amount each
 time it’s called.
 */

// The return type of makeIncrementer is () -> Int. This means that it returns a function, rather than a simple value.
// The function it returns has no parameters, and returns an Int value each time it’s called.

// function has a single Int parameter with an argument label of forIncrement, parameter name of amount.
// The argument value passed to this parameter specifies how much runningTotal should be incremented by each time
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() // 10
incrementByTen() // 20
incrementByTen() // 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() // 7
incrementBySeven() // 14
incrementBySeven() // 21
incrementByTen() // 40


/*
 In the example above, incrementBySeven and incrementByTen are constants, 
 but the closures these constants refer to are still able to increment the
 runningTotal variables that they have captured. This is because functions
 and closures are reference types.
*/

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
// returns a value of 50

incrementByTen()
// returns a value of 60
