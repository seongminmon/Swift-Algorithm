//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 9375 : 패션왕 신해빈
// https://www.acmicpc.net/problem/9375

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    
    var dict = [String: Int]()
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        dict[input[1], default: 0] += 1
    }
    
    var ans = 1
    for num in dict.values {
        ans *= num + 1
    }
    print(ans-1)
}
