//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/17/24.
//
// 2792 : 보석 상자
// https://www.acmicpc.net/problem/2792

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var arr: [Int] = []
for _ in 0..<m {
    arr.append(Int(readLine()!)!)
}

var ans = Int(1e9)
var start = 1
var end = Int(1e9)
while start <= end {
    let mid = (start + end) / 2
    
    var n = n
    var flag = true
    for i in 0..<m {
        n -= arr[i] % mid == 0 ? arr[i] / mid : arr[i] / mid + 1
        if n < 0 {
            flag = false
            break
        }
    }
    
    if flag {
        ans = min(ans, mid)
        end = mid - 1
    } else {
        start = mid + 1
    }
}
print(ans)
