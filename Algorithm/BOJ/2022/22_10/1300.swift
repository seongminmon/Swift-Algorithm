//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/20.
//
// 1300 : K번째 수
// https://www.acmicpc.net/problem/1300

import Foundation

// 입력
let n = Int(readLine()!)!
let k = Int(readLine()!)!

// 풀이
var start = 1
var end = n*n

while start <= end {
    let mid = (start + end) / 2
    
    var cnt = 0
    for i in 1 ... n {
        cnt += min(mid / i, n)
    }
    
    if cnt >= k {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

// 출력
print(start)
