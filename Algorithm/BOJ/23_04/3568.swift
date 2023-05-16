//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 3568 : iSharp
// https://www.acmicpc.net/problem/3568

import Foundation

var str = readLine()!
    .split(separator: ",")
    .joined()
    .split(separator: " ")

str[str.count-1].removeLast()
let basicType = str.removeFirst()

for i in 0 ..< str.count {
    let s = str[i].map { String($0) }
    
    var result = basicType
    for i in stride(from: s.count-1, through: 0, by: -1) {
        if !Character(s[i]).isLetter {
            if s[i] == "[" {
                result += "]"
            } else if s[i] == "]" {
                result += "["
            } else {
                result += s[i]
            }
        } else {
            break
        }
    }
    result += " "
    
    for i in 0 ..< s.count {
        if Character(s[i]).isLetter {
            result += s[i]
        } else {
            break
        }
    }
    result += ";"
    
    print(result)
}
