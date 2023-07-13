//
//  3079.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/21.
//
// 3079 : 입국심사
// https://www.acmicpc.net/problem/3079

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int64(String($0))! }
let (n,m) = (nm[0], nm[1])
var times = [Int64]()
for _ in 0 ..< n {
    times.append(Int64(readLine()!)!)
}

// 풀이
var start: Int64 = 1
var end: Int64 = times.max()! * m

var result: Int64 = 0
while start <= end {
    let mid = (start + end) / 2
    
    var tempM: Int64 = 0
    for i in times {
        tempM += mid / Int64(i)
    }
    
    if tempM < m {
        start = mid + 1
    } else {
        end = mid - 1
        result = mid
    }
}

// 출력
print(result)
