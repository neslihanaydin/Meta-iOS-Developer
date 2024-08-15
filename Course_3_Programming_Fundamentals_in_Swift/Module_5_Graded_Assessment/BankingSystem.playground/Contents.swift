import UIKit


// Part 1: Create the banking system
class BankingSystem {
    var accountType = ""
    var isOpened = true
    func welcomeCustomer() {
        print("Welcome to your virtual bank system.")
    }
    
    func onboardCustomerAccountOpening() {
        print("What kind of account would you like to make?")
        print("1. Debit account")
        print("2. Credit account")
    }
    
    func makeAccount(numberPadKey: Int) {
        print("The selected option is \(numberPadKey)")
        switch numberPadKey {
        case 1:
            accountType = "debit"
        case 2:
            accountType = "credit"
        default:
            print("Invalid input: \(numberPadKey)")
            return
        }
        print("You have opened a \(accountType) account.")
    }
    
    func moneyTransfer(transferType: String, transferAmount: Int, bankAccount: inout BankAccount) {
        switch transferType {
        case "withdraw":
            if accountType == "credit" {
                bankAccount.creditWithdraw(transferAmount)
            } else if accountType == "debit" {
                bankAccount.debitWithdraw(transferAmount)
            }
        case "deposit":
            if accountType == "credit" {
                bankAccount.creditDeposit(transferAmount)
            } else if accountType == "debit" {
                bankAccount.debitDeposit(transferAmount)
            }
        default:
            break
        }
    }
    
    func checkBalance(bankAccount: BankAccount) {
        switch accountType {
        case "credit":
            print(bankAccount.creditBalanceInfo)
        case "debit":
            print(bankAccount.debitBalanceInfo)
        default:
            break
        }
    }
}
/*
let banking = BankingSystem()

repeat {
    banking.welcomeCustomer()
    banking.onboardCustomerAccountOpening()
    let numberPadKey = Int.random(in: 1...3)
    banking.makeAccount(numberPadKey: numberPadKey)
} while banking.accountType == ""

*/
// Part 2: Define the bank account operations
// print("\n\nPart 2: Define the bank account operations")

struct BankAccount {
    var debitBalance = 0
    var creditBalance = 0
    let creditLimit = 100
    var debitBalanceInfo: String {
        "Debit balance: $\(debitBalance)"
    }
    var availableCredit: Int {
        creditLimit + creditBalance
    }
    var creditBalanceInfo: String {
        "Available credit: $\(availableCredit)"
    }
    mutating func debitDeposit(_ amount: Int) {
        debitBalance += amount
        print("Deposited $\(amount). \(debitBalanceInfo)")
    }
    mutating func creditDeposit(_ amount: Int) {
        creditBalance += amount
        print("Credit deposit $\(amount). \(creditBalanceInfo)")
        if creditBalance == 0 {
            print("Paid off credit balance.")
        } else if creditBalance > 0{
            print("Overpaid credit balance.")
        }
    }
    mutating func debitWithdraw(_ amount: Int) {
        if amount > debitBalance {
            print("Insufficient fund to withdraw $\(amount). \(debitBalanceInfo)")
        } else {
            debitBalance -= amount
            print("Debit withdraw: $\(amount). \(debitBalanceInfo)")
        }
    }
    mutating func creditWithdraw(_ amount: Int) {
        if amount > availableCredit {
            print("Insufficient credit to withdraw $\(amount). \(creditBalanceInfo)")
        } else {
            creditBalance -= amount
            print("Credit withdraw: $\(amount). \(creditBalanceInfo)")
        }
    }
}
/*
var bankAccount = BankAccount()

print(bankAccount.debitBalanceInfo)
bankAccount.debitDeposit(100)
bankAccount.debitWithdraw(20)
bankAccount.debitWithdraw(81)

print(bankAccount.creditBalanceInfo)
bankAccount.creditWithdraw(101)
bankAccount.creditWithdraw(100)
bankAccount.creditDeposit(50)
bankAccount.creditDeposit(50)
bankAccount.creditDeposit(100)
*/

// Part 3: Manage the bank account
let virtualBankSystem = BankingSystem()
virtualBankSystem.welcomeCustomer()

repeat {
    virtualBankSystem.onboardCustomerAccountOpening()
    let numberPadKey = Int.random(in: 1...3)
    virtualBankSystem.makeAccount(numberPadKey: numberPadKey)
} while virtualBankSystem.accountType == ""

let transferAmount = 50
print("Transfer amount: $\(transferAmount)")
var bankAccount = BankAccount()

repeat {
    print("What would you like to do?")
    print("1. Check bank account")
    print("2. Withdraw money")
    print("3. Deposit money")
    print("4. Close the system")
    let option = Int.random(in: 1...5)
    print("You selected option \(option)")
    switch option {
    case 1:
        virtualBankSystem.checkBalance(bankAccount: bankAccount)
    case 2:
        virtualBankSystem.moneyTransfer(transferType: "withdraw", transferAmount: transferAmount, bankAccount: &bankAccount)
    case 3:
        virtualBankSystem.moneyTransfer(transferType: "deposit", transferAmount: transferAmount, bankAccount: &bankAccount)
    case 4:
        virtualBankSystem.isOpened = false
        print("The system is closed.")
    default:
         break
    }
} while virtualBankSystem.isOpened == true




