//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/4/23.
//
// 16637 : 괄호 추가하기
// https://www.acmicpc.net/problem/16637

import Foundation

let n = Int(readLine()!)!
let str = readLine()!.map { String($0) }

var numbers = [Int]()
var ops = [String]()
for i in 0..<n {
    if i % 2 == 0 {
        numbers.append(Int(str[i])!)
    } else {
        ops.append(str[i])
    }
}

func calculate(_ op: String, _ num1: Int, _ num2: Int) -> Int {
    switch op {
    case "+": return num1 + num2
    case "-": return num1 - num2
    default: return num1 * num2
    }
}

var ans = -Int.max
func solve(_ idx: Int, _ sum: Int) {
    if idx == numbers.count-1 {
        ans = max(ans, sum)
        return
    }
    
    solve(idx+1, calculate(ops[idx], sum, numbers[idx+1]))
    if idx + 2 < numbers.count {
        let temp = calculate(ops[idx+1], numbers[idx+1], numbers[idx+2])
        solve(idx+2, calculate(ops[idx], sum, temp))
    }
}
solve(0, numbers[0])
print(ans)
