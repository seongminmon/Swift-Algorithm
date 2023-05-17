//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/16.
//
// 16639 : 괄호 추가하기 3
// https://www.acmicpc.net/problem/16639

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.map { String($0) }

var numbers = [Int]()
var ops = [String]()
for i in 0..<n {
    if i % 2 == 0 {
        numbers.append(Int(input[i])!)
    } else {
        ops.append(input[i])
    }
}

func operate(_ a: Int, _ b: Int, _ op: String) -> Int {
    switch op {
    case "+": return a + b
    case "-": return a - b
    default: return a * b
    }
}

var maxDP = [[Int]](repeating: [Int](repeating: Int.min, count: numbers.count), count: numbers.count)
var minDP = [[Int]](repeating: [Int](repeating: Int.max, count: numbers.count), count: numbers.count)
for i in 0..<numbers.count {
    maxDP[i][i] = numbers[i]
    minDP[i][i] = numbers[i]
}

for len in 1..<numbers.count {
    for start in 0..<numbers.count-len {
        let end = start + len
        
        for mid in start..<end {
            let values = [
                operate(maxDP[start][mid], maxDP[mid+1][end], ops[mid]),
                operate(maxDP[start][mid], minDP[mid+1][end], ops[mid]),
                operate(minDP[start][mid], maxDP[mid+1][end], ops[mid]),
                operate(minDP[start][mid], minDP[mid+1][end], ops[mid])
            ]
            
            maxDP[start][end] = max(maxDP[start][end], values.max()!)
            minDP[start][end] = min(minDP[start][end], values.min()!)
        }
    }
}

print(maxDP[0][numbers.count-1])
