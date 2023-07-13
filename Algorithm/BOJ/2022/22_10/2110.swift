//
//  2110.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/20.
//
// 2110 : 공유기 설치
// https://www.acmicpc.net/problem/2110

import Foundation

// 입력
let nc = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,c) = (nc[0], nc[1])
var arr = [Int]()
for _ in 0 ..< n {
    arr.append( Int(readLine()!)! )
}

// 풀이
arr.sort()

var result = 0
var start = 1
var end = arr[n-1] - arr[0]
while start <= end {
    let mid = (start + end) / 2
    
    var cnt = 1
    var dist = 0
    for i in 1 ..< n {
        dist += arr[i] - arr[i-1]
        
        if dist >= mid {
            cnt += 1
            dist = 0
        }
    }
    
    if cnt >= c {
        start = mid + 1
        result = mid
    } else {
        end = mid - 1
    }
}

// 출력
print(result)
