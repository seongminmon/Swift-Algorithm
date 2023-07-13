//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/22.
//
// 2343 : 기타 레슨
// https://www.acmicpc.net/problem/2343

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
var start = arr.max()!
var end = arr.reduce(0,+)

var result = 0
while start <= end {
    let mid = (start + end) / 2
    
    var cnt = 0
    var sum = 0
    for i in arr {
        sum += i
        
        if sum == mid {
            cnt += 1
            sum = 0
        } else if sum > mid {
            cnt += 1
            sum = i
        }
    }
    if sum > 0 { cnt += 1 }
    
    if cnt > m {
        start = mid + 1
    } else {
        end = mid - 1
        result = mid
    }
}

// 출력
print(result)
