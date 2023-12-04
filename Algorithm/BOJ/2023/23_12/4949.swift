//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/4/23.
//
// 4949 : 균형잡힌 세상
// https://www.acmicpc.net/problem/4949

import Foundation

while let input = readLine() {
    if input == "." { break }
    
    let str = input.map { String($0) }
    var stack = [String]()
    for s in str {
        switch s {
        case "(", "[": stack.append(s)
        case ")":
            if let last = stack.last, 
                last == "(" {
                stack.removeLast()
            } else {
                stack.append(s)
            }
        case "]":
            if let last = stack.last, 
                last == "[" {
                stack.removeLast()
            } else {
                stack.append(s)
            }
        default: break
        }
    }
    
    print(stack.isEmpty ? "yes" : "no")
}
