//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/11.
//
// 10836 : 여왕벌
// https://www.acmicpc.net/problem/10836

// 부분 성공
import Foundation

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m,n) = (mn[0], mn[1])

var lines = [Int](repeating: 1, count: 2*m-1)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (zero, one, two) = (input[0], input[1], input[2])
    
    for i in zero..<zero+one {
        lines[i] += 1
    }
    for i in zero+one..<zero+one+two {
        lines[i] += 2
    }
}

var result = ""
for i in 0..<m {
    result += "\(lines[m-i-1]) "
    for j in m..<2*m-1 {
        result += "\(lines[j]) "
    }
    result += "\n"
}
print(result)
