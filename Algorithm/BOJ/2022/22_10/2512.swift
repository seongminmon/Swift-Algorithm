//
//  2512.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/22.
//
// 2512 : 예산
// https://www.acmicpc.net/problem/2512

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
let m = Int(readLine()!)!

// 풀이
arr.sort()

var start = 0
var end = arr.last!

var result = 0
while start <= end {
    let mid = (start + end) / 2
    
    var tempM = 0
    for i in arr {
        tempM += i < mid ? i : mid
    }
    
    if tempM <= m {
        start = mid + 1
        result = mid
    } else {
        end = mid - 1
    }
}

// 출력
print(result)
