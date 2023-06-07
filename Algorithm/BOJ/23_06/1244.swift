//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/01.
//
// 1244 : 스위치 켜고 끄기
// https://www.acmicpc.net/problem/1244

import Foundation

let n = Int(readLine()!)!
var switches = [-1] + readLine()!.split(separator: " ").map { Int(String($0))! }

let m = Int(readLine()!)!
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let num = input[1]
    if input[0] == 1 {
        for i in stride(from: num, through: n, by: num) {
            switches[i] = switches[i] == 0 ? 1 : 0
        }
    } else {
        switches[num] = switches[num] == 0 ? 1 : 0
        var start = num-1
        var end = num+1
        while 1 <= start && end <= n {
            if switches[start] != switches[end] { break }
            switches[start] = switches[start] == 0 ? 1 : 0
            switches[end] = switches[end] == 0 ? 1 : 0
            start -= 1
            end += 1
        }
    }
}

var result = ""
for i in 1...n {
    result += "\(switches[i]) "
    if i % 20 == 0 { result += "\n" }
}
print(result)
