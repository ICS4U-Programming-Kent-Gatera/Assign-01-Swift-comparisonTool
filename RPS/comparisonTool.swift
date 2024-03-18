import Foundation;

/**
 * My program calculates how much energy is in an object.
 *
 * @author  Kent Gatera
 * @version 1.0
 * @since   2024-Mar-18
 */

enum ErrorCases: Error {
    case invalidNumeral
}

/* This function is getting
*/
func strSizeComp() throws -> String {
    var biggestCharCount = 0
    var biggestStr = ""
    var counter = 1
    
    print("How many sentences/words would you like to compare?: ", terminator: "")
    
    // the guard statement runs when a certain condition is not met.
    guard let compareAmount = readLine(), let compareAmountInt = Int(compareAmount) else {
        throw ErrorCases.invalidNumeral
    }
    // We getting the input for every number we need to compare.
    for _ in 1...compareAmountInt {
        print("What will be your \(counter) sentence/word: ", terminator: "")

        // Getting sentence/words as input.
        if let userInput = readLine() {
            if userInput.count > biggestCharCount {
                // If it is the biggest, we assign it as the biggest.
                biggestCharCount = userInput.count
                biggestStr = userInput
            }
        } else {
            throw ErrorCases.invalidNumeral
        }
        counter += 1
    }
    
    print("\(biggestStr) is the largest word/sentence.")
    return biggestStr
}

func numberSizeComp() throws -> Double {
    var biggestNum: Double = 0
    var counter = 1
    
    print("How many numbers would you like to compare?: ", terminator: "" )
    
    guard let compareAmount = readLine(), let compareAmountInt = Int(compareAmount) else {
        throw ErrorCases.invalidNumeral
    }
    
    for _ in 1...compareAmountInt {
        print("What will be your \(counter) number: ", terminator: "" )
        // Getting and converting input to double so decimals can also be compared.
        if let userInput = readLine(), let userInputDouble = Double(userInput) {
            if userInputDouble > biggestNum {
                // When the program finds a bigger number, it tags it as the biggest number.
                biggestNum = userInputDouble
            }
        } else {
            throw ErrorCases.invalidNumeral
        }
        counter += 1
    }
    
    return biggestNum
}
// Explaining the program and initializing userChoice.
print("This program compares numbers and the length of words and sentences and tells you which is the biggest.\n")
var userChoice = ""

repeat {
    do {
        print("Would you like to compare sentences (Press 1) or numbers? (Press 2). (Press q to quit): ", terminator: "")
        // Calling the function for each option chosen.
        if let input = readLine() {
            userChoice = input
            switch userChoice {
                case "q":
                    print("Thank you for playing.")
                case "1":
                    let finalStr = try strSizeComp()
                    print("It has \(finalStr.count) characters.")
                case "2":
                    let finalNum = try numberSizeComp()
                    print("The largest number is \(finalNum)")
                default:
                    print("Please pick a valid option.")
            }
        }
    } catch {
        print("Please enter a valid integer amount.")
    }
} while userChoice != "q"
