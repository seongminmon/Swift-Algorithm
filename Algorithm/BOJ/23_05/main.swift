//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/29.
//
// 1918 : 후위 표기식
// https://www.acmicpc.net/problem/1918

import Foundation

func getPrior(_ ch: Character) -> Int {
    switch ch {
    case "+","-": return 1
    case "*","/": return 2
    default: return 0
    }
}

let str = readLine()!
var result = ""
var ops = ""
for ch in str {
    if ch.isLetter {
        result.append(ch)
    } else if ch == "(" {
        ops.append(ch)
    } else if ch == ")" {
        while let last = ops.popLast(), last != "(" {
            result.append(last)
        }
    } else {
        while let last = ops.last, getPrior(last) >= getPrior(ch) {
            result.append(ops.removeLast())
        }
        ops.append(ch)
    }
}

print(result + ops.reversed())
