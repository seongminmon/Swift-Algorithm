//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/17/24.
//
// 3273 : 두 수의 합
// https://www.acmicpc.net/problem/3273

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let x = Int(readLine()!)!

arr.sort()

var ans = 0
var s = 0
var e = n-1
while s < e {
    if arr[s] + arr[e] == x {
        ans += 1
        s += 1
    } else if arr[s] + arr[e] < x {
        s += 1
    } else {
        e -= 1
    }
}
print(ans)
