//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/28/24.
//
// 14627 : 파닭파닭
// https://www.acmicpc.net/problem/14627

import Foundation

let sc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (s,c) = (sc[0], sc[1])

var arr = [Int]()
for _ in 0..<s {
    arr.append(Int(readLine()!)!)
}

let sum = arr.reduce(0, +)

var ans = 0
var start = 1
var end = Int(1e9)
while start <= end {
    let mid = (start + end) / 2
    
    var cnt = 0
    for i in 0..<s {
        cnt += arr[i] / mid
        if cnt > c { break }
    }
    
    if cnt < c {
        end = mid - 1
    } else {
        start = mid + 1
        ans = sum - c * mid
    }
}
print(ans)
