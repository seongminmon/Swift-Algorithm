//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/08.
//
// 2785 : 체인
// https://www.acmicpc.net/problem/2785

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

arr.sort()

var ans = 0
var start = 0
var end = n-1
while start < end {
    arr[start] -= 1
    
    if arr[start] == 0 {
        start += 1
    }
    
    end -= 1
    ans += 1
}

print(ans)
