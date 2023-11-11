//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/11.
//
// 1508 : 레이스
// https://www.acmicpc.net/problem/1508

import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = [Int]()
var start = 0
var end = n
while start <= end {
    let mid = (start + end) / 2
    
    var temp = [0]
    var pre = arr[0]
    for i in 1..<k {
        if arr[i] - pre >= mid {
            pre = arr[i]
            temp.append(i)
        }
        
        if temp.count == m {
            break
        }
    }
    
    if temp.count == m {
        start = mid + 1
        ans = temp
    } else {
        end = mid - 1
    }
}

var result = [String](repeating: "0", count: k)
for i in ans { result[i] = "1" }
print(result.joined())
