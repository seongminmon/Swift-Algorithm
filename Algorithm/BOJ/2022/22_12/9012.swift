//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 9012 : 괄호
// https://www.acmicpc.net/problem/9012

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.map { String($0) }
    var stack = [String]()
    for i in input {
        if i == "(" {
            stack.append(i)
        } else {
            if let last = stack.last, last == "(" {
                stack.removeLast()
            } else {
                stack.append(i)
                break
            }
        }
    }
    
    if stack.isEmpty {
        print("YES")
    } else {
        print("NO")
    }
}
