# Swift Optional Type Implementing

## Introduction

You use optionals in situations where a value may be absent. An optional represents two possibilities: Either there is a value of explicitly or implicitly defined type, and you can unwrap the optional to access that value, or there isn’t a value at all.  
In Swift only optionals can have a *nil* value(that is a representation of value absence).

## About My Implementation

Here is my own **_Swift Optional Type Implementing_** and some its functionality such as **_Force Unwrapping_**, **_Optional Chaining_** and **_Simplified Initialization_** with some examples of all it.  
In this implementation I used such non-trivial Swift concepts such as **Advanced Operators** and **Generics**.   
I implemented **Optionals** with Swift **Enum**, where _.none_ is _nil_ and _optionalValue_ is _Optional()_. _Force Unwrapping_ symbol _"!"_ is _"%"_  in my code and _Optional Chaining_ can be done with using **Optional~> \ .SomeProperty** chain.
Also I simplified initialization - you don't need to write **=Optional(someValue)**, instead you can just use _"<-"_ symbol.  
You can see some examples in my code if something remains unclear to you.
## References
[Optionals](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
