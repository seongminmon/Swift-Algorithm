//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/13.
//
// 10800 : 컬러볼
// https://www.acmicpc.net/problem/10800

import Foundation

struct Ball {
    var id: Int
    var color: Int
    var size: Int
}

let n = Int(readLine()!)!
var balls = [Ball]()
for i in 0..<n {
    let cs = readLine()!.split(separator: " ").map { Int(String($0))! }
    balls.append(Ball(id: i, color: cs[0], size: cs[1]))
}
balls.sort { $0.size < $1.size }

var colorSum = [Int](repeating: 0, count: n+1)
var ans = [Int](repeating: 0, count: n)

var totalSum = 0
var idx = 0
for a in balls {
    var b = balls[idx]
    while b.size < a.size {
        totalSum += b.size
        colorSum[b.color] += b.size
        
        idx += 1
        b = balls[idx]
    }
    ans[a.id] = totalSum - colorSum[a.color]
}

var result = ""
for i in ans { result += "\(i)\n" }
print(result)
