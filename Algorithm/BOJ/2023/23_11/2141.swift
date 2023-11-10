//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/08.
//
// 2141 : 우체국
// https://www.acmicpc.net/problem/2141

import Foundation

let n = Int(readLine()!)!
var arr = [(Int64,Int64)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int64(String($0))! }
    arr.append((input[0], input[1]))
}

arr.sort { $0.0 < $1.0 }

var totalSum: Int64 = 0
for i in 0..<arr.count {
    totalSum += arr[i].1
}

var leftSum: Int64 = 0
var minDiff = Int64.max
var ans = 0
for i in 0..<n {
    let rightSum = totalSum - leftSum - arr[i].1
    let diff = abs(rightSum - leftSum)
    
    leftSum += arr[i].1
    
    if diff < minDiff {
        minDiff = diff
        ans = Int(arr[i].0)
    }
}

print(ans)
