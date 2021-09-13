import Foundation

//:**Forced Unwrapping**
postfix operator %

//:**Initialization**
infix operator <-

//:**Optional Chaining**
precedencegroup Chaining {
    associativity : left
}

infix operator ~> : Chaining

//:*OPTIONALS*
enum Optionals<T> {
    case none
    case optionalValue(_ someValue: T)
    
    init(_ value: T) {
        self = .optionalValue(value)
    }

    //:**Forced Unwrapping**
    static postfix func %(unwrapped: Optionals<T>) -> T {
        switch unwrapped {
        case .none:
            fatalError()
        case .optionalValue(let value):
            return value
        }
    }
    
    //:**Initialization**
    static func <-(_ optional: inout Optionals<T>,_ value: T){
        optional = Optionals.optionalValue(value)
    }
    static func <-(_ optional: inout Optionals<T>,_ value: Optionals<T>) {
        switch value {
        case .none:
            optional = Optionals.none
        default:
            fatalError()
        }
    }
    
    //:**Optional Chaining**
    static func ~><U>(_ optional: Optionals<T>, property: KeyPath<T, U>) -> Optionals<U> {
        switch optional {
        case .none:
            return Optionals<U>.none
        default:
            return .optionalValue(optional% [keyPath: property])
        }
    }
    
}


//:**Forced Unwrapping**
var someOptional : Optionals<String> = Optionals("Fuad")
//var someOptional : Optionals<String> = .none
let anotherOptional = someOptional%

//:**Initialization**
var myOptional : Optionals<String> = .optionalValue("Hello")
var myValue = "Hello World!"
myOptional <- "Hello World!"
myOptional <- .none
//print(myOptional%)
myOptional <- "Baku"

//:**Optional Chaining My Implementation**
print("My Implementation:")
var optionalChaining : Optionals<[String]> = .optionalValue([])
optionalChaining <- ["Apple","Samsung"]
//optionalChaining <- .none
var possibleValue = optionalChaining~>\.count~>\.hashValue
print(possibleValue)
print(optionalChaining~>\.isEmpty)

//:**Swift Optional Chaining**
print("\nSwift Optionals:")
var optional2 : String? = "London"
var someInteger = optional2?.count//It also an Optional
var arraysome : [String]? = ["a","b"]
print(arraysome?.isEmpty)
