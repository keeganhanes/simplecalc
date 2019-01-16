//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var result: Int = 0
        if args.last == "count" {
            result = args.count - 1
        } else if args.last == "avg" {
            if args.count - 1 != 0 {
                for index in 1...(args.count - 1) {
                    result += Int(args[index - 1])!
                }
                result = result / (args.count - 1)
            }
        } else if args.last == "fact" {
            if args.count - 1 != 0 {
                result = 1
                let n: Int = Int(args[0])! + 1
                for i in 1..<n {
                    result = result * i
                }
            }
        } else {
            let first = Int(args[0])
            let operation = args[1]
            let second = Int(args[2])
            switch operation {
            case "+":
                result = first! + second!
            case "-":
                result = first! - second!
            case "*":
                result = first! * second!
            case "/":
                result = first! / second!
            case "%":
                result = first! % second!
            default:
                result = 0
            }
        }
        return result
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

