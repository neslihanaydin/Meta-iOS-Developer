import UIKit

var greeting = "Hello, playground"

var train:[String] = ["wheat", "barley", "potato", "salt"]

print(train)
print(train[0])

print(train.count)

train.append("rocks")
print(train)

train.insert("onion", at: 3)
print(train)

train.remove(at:4)
print(train)

// Multiple game levels

var levelScores:[Int] = []

if levelScores.count == 0 {
    print("Welcome! There is no level right now.")
}

// suppose players completed the first level with a score of 10 and also received a bonus score of 40.
let firstLevelScore = 10
levelScores.append(firstLevelScore)
print("The first level's score is \(levelScores[0])")
let levelBonusScore = 40
levelScores[0] += levelBonusScore
print("The first level's total score is \(levelScores[0])")

// other free level scores
let freeLevelScores:[Int] = [20, 30]
levelScores += freeLevelScores
print(levelScores)

let freeLevels = 3
if levelScores.count == freeLevels {
    print("You have to buy the game in order to play its full version.")
    levelScores = []
    print("Game restarted!")
}

// Tuples
// basic login feature for a banking app

let credentials = ("", -1111)

if (credentials.0 == "" || credentials.1 < 0) {
    print("Invalid credentials!")
} else {
    print("The username is \(credentials.0) and the passcode is \(credentials.1)")
}
let fullCredentials = (password: "pass", passcode: 1111)
if (fullCredentials.password == "" || fullCredentials.passcode < 0) {
    print("Invalid credentials!")
} else {
    print("The username is \(fullCredentials.0) and the passcode is \(fullCredentials.1)")
}

// Dictionaries
// Weather forecast

var weeklyTemperatures: [String: Int] = [:]
weeklyTemperatures = ["Monday": 70, "Tuesday": 75, "Wednesday": 80, "Thursday": 85, "Friday": 90, "Saturday": 95]
weeklyTemperatures["Monday"]! += 20
print("The temp on Monday is \(weeklyTemperatures["Monday"]!)")

if let value = weeklyTemperatures["Sunday"]{
    print("Sunday is available")
} else {
    weeklyTemperatures["Sunday"] = 100
    print(weeklyTemperatures["Sunday"]!)
}

if weeklyTemperatures.count == 7 {
    print(weeklyTemperatures)
    weeklyTemperatures = [:]
}

// Loops with collection types

let levelScores1 = [10, 20, 30, 40, 50, 60, 70]
print(levelScores1.enumerated())

for (level, score) in levelScores1.enumerated() {
  print("The score of level \(level + 1) is \(score).")
}
var gameScore = 0
for levelScore in levelScores1 {
  gameScore += levelScore
}
print("The game's score is \(gameScore).")
let weeklyTemperatures1 = [
  "Monday": 70, "Tuesday": 75, "Wednesday": 80, "Thursday": 85, "Friday": 90, "Saturday": 95,
  "Sunday": 100
]
for (day, temperature) in weeklyTemperatures1 {
  print("The temperature on \(day) is \(temperature)°F.")
}
let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
let temperatures = [70, 75, 80, 85, 90, 95, 100]
for index in 0...6 {
  print("The temperature on \(days[index]) is \(temperatures[index])°F.")
}
