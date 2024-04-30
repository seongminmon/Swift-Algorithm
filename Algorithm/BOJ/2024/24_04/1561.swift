//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/29/24.
//
// 1561 : 놀이 공원
// https://www.acmicpc.net/problem/1561

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

// n명이 탑승하게되는 시간
var time = 0
var start = 0
var end = 30 * n
while start <= end {
    let mid = (start + end) / 2
    
    var cnt = 0
    for i in 0..<m {
        cnt += mid / arr[i] + 1
    }
    
    if cnt < n {
        start = mid + 1
    } else {
        end = mid - 1
        time = mid
    }
}

// n번째 순서 찾기
var cnt = 0
if time != 0 {
    for i in 0..<m {
        cnt += (time-1) / arr[i] + 1
    }
}

for i in 0..<m {
    if time % arr[i] == 0 {
        cnt += 1
    }
    
    // n번째 탑승자
    if cnt == n {
        print(i+1)
        break
    }
}
