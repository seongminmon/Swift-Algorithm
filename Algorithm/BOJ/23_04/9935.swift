//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 9935 : 문자열 폭발
// https://www.acmicpc.net/problem/9935

import Foundation

let str = readLine()!.map{ String($0) }
let bomb = readLine()!

let bombLast = String(bomb.last!)
var stack = [String]()
for s in str {
    stack.append(s)
    
    if stack.count < bomb.count || s != bombLast { continue }
    
    if bomb == stack[(stack.count - bomb.count)...].joined() {
        for _ in 0 ..< bomb.count {
            stack.removeLast()
        }
    }
}

print(stack.isEmpty ? "FRULA" : stack.joined())
