//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/21/24.
//
// 6236 : 용돈 관리
// https://www.acmicpc.net/problem/6236

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

var start = arr.max()!
var end = arr.reduce(0, +)
var ans = end
while start <= end {
    let mid = (start + end) / 2
    
    var cnt = 0
    var temp = 0
    for num in arr {
        if temp >= num {
            temp -= num
        } else {
            temp = mid - num
            cnt += 1
        }
    }
    
    if cnt > m {
        start = mid + 1
    } else {
        end = mid - 1
        ans = min(ans, mid)
    }
}

print(ans)
