//: # Homework 1 - Swift Playground

//: In order to answer the [EXPLAIN YOUR ANSWER HERE] questions,
//: you must go to Editor -> Show Raw Markup and edit the bracketed text.
//: Once done, go to Editor -> Show Rendered Markup to return to the previous view mode.


import UIKit


//: ## Q1: Optionals
class Words {
    var wordA : String!
    var wordB : String!
    
    init (wordA: String?, wordB: String?) {
        self.wordA = wordA
        self.wordB = wordB
    }

//: ### Are the values passed in to the **init** function and those set to the instance
//: ### variables the same type? If not, why?


//: Yes, they are both the same type (String). The instance variables are defined as Strings, 
//: and the constructor takes in Strings for the values of those instance variables. It is
//: clear from the structure of the Words class that wordA and wordB will have String values 
//: after they are first set, so it makes sense for the wordA and wordB instance variables to 
//: be implicitly unwrapped and not have to be checked every time it is accessed. The init
//: parameters here are optional, meaning they might contain some String value or no value at
//: all. By definition, these cannot contain any values of any other type.


//: ## Q2: Variable Types and Function Types
    class func arePalindromes(words: [String]) -> Bool {
        let reversedWords = words.map(){String($0.characters.reverse())}
        let numElements = words.count
        
        for var i = 0; i < numElements; i++ {
            if words[i] != reversedWords[i] {
                return false
            }
        }
        
        return true
    }
//: ### Why does the compiler dislike the **for loop**? Fix it.
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: (1) The for-loop increment variable is created with a let, but that would mean that i is
//: a constant. This is not correct because the loop incrementing variable should not be a
//: constant. (2) Added "class" to the beginning of the function declaration, because
//: arePalindromes() is called using the Words class.


//: ## Q3: More Functions and Object Initialization
    func isAnagram() -> Bool {
        var countLetters : [Character : Int] = [:] //Line X
        let lenA = self.wordA.characters.count
        let lenB = self.wordB.characters.count
        
        if lenA != lenB {
            return false
        }
        
        var arrA = Array(self.wordA.characters)
        var arrB = Array(self.wordB.characters)
        
        for i in 0...lenA-1 {
            let letter = arrA[i]
            if let val = countLetters[letter] { //Line Y
                countLetters[letter] = val + 1
            } else {
                countLetters[letter] = 1
            }
        }
        
        for i in 0...lenB-1 {
            let letter = arrB[i]
            if let val = countLetters[letter] {
                countLetters[letter] = val - 1
            } else {
                return false
            }
        }
        
        for (_, count) in countLetters {
            if count != 0 {
                return false
            }
        }
        
        return true
    }
//: ### What is the problem with declaring **countLetters** as we do in **Line X**,
//: ### and then using it in **Line Y**? Fix it (by only changing **Line X**).
//: ### What else is wrong with this function? You may have to refer to (but **not**
//: ### change) the code at the very bottom. Debug the function.


//: (1) The problem with countLetters is that the dictionary is not initialized. To 
//: initialize the dictionary, I added " = [:]" in Line X. (2) Other changes: 1) Changed 
//: isAnagram() from a class function to a normal function by removing "class" from the
//: function declaration. isAnagram() is supposed to be called on an object of the Words
//: class, so it should not have the class prefix. 2) Changed final "return nil" to "return
//: true" in order to return a Boolean. 3) Changed "var lenA" and "var lenB" to "let
//: lenA" and "let lenB" because their values are not changed in the function. This 
//: optimization was recommended by Xcode. 4) Removed "letter" from the "for (letter, count)
//: in countLetters" loop because letter is not used in that for-loop. This optimization
//: was recommended by Xcode.
    
    
}


//: ## Check Your Answers
//: ### If you now see an output stream in the right sidebar, you have successfully
//: ### debugged the code above. Remember that you must also fully and correctly answer
//: ### all of the written questions above to receive full credit for this homework.


//: **DO NOT** touch any code below this point.
Words.arePalindromes(["hih", "racecar", "mom", "wow"])
Words.arePalindromes(["gene", "shawn", "hello"])
var wordsObj = Words.init(wordA: "anagram", wordB: "managra")
wordsObj.isAnagram()
wordsObj.wordA = "hello"
wordsObj.wordB = "what"
wordsObj.isAnagram()
