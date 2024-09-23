import UIKit

enum CalculatorError: Error {
    case divisionByZero
}


class Calculator {
    func divide(x: Double, y: Double) throws -> Double  {
        if y == 0 { throw CalculatorError.divisionByZero}
        return x / y
    }
}

let calculator = Calculator()
do {
    let successfulResult = try calculator.divide(x: 10, y: 40)
    print(successfulResult)

    let invalidResult = try calculator.divide(x: 10, y: 0)
    print(invalidResult)

} catch CalculatorError.divisionByZero {
    print("Division by zero detected and not allowed.")
}

// Defer
func example() {
    defer {
        print("This is the last message")
    }
    print("This is the first message")
}
example()

func printTheNumbers() {
    defer { print("1") }
    defer { print("2") }
    defer { print("3") }

    print("4")
}
printTheNumbers()
