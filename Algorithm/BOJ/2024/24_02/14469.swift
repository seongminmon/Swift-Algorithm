//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/6/24.
//
// 14469 : 소가 길을 건너간 이유 3
// https://www.acmicpc.net/problem/14469

import Foundation

let n = Int(readLine()!)!
var arr = [(Int,Int)]()     // (도착시간, 검문시간)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

// 도착시간 기준 오름차순 정렬
arr.sort { $0.0 < $1.0 }

var ans = 0
for i in 0..<n {
    ans = max(ans, arr[i].0)
    ans += arr[i].1
}
print(ans)
