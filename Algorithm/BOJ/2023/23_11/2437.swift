//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/20/23.
//
// 2437 : 저울
// https://www.acmicpc.net/problem/2437

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

arr.sort()

var sum = 0
for num in arr {
    if num > sum + 1 {
        break
    }
    sum += num
}
print(sum + 1)
