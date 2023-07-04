//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/23.
//
// 2891 : 카약과 강풍
// https://www.acmicpc.net/problem/2891

import Foundation

// 입력
let nsr = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,s,r) = (nsr[0], nsr[1], nsr[2])

var arr = [Int](repeating: 1, count: n)
var sArr = readLine()!.split(separator: " ").map{ Int(String($0))! }
for i in sArr {
    arr[i-1] -= 1
}
var rArr = readLine()!.split(separator: " ").map{ Int(String($0))! }
for i in rArr {
    arr[i-1] += 1
}

// 풀이
for i in 0 ..< n {
    if arr[i] == 1 {
        continue
    }
    
    if arr[i] == 0 {
        if i > 0, arr[i-1] > 1 {
            arr[i-1] -= 1
            arr[i] += 1
        } else if i < n-1, arr[i+1] > 1 {
            arr[i+1] -= 1
            arr[i] += 1
        }
    }
}

// 출력
var result = 0
for i in 0 ..< n {
    if arr[i] == 0 {
        result += 1
    }
}
print(result)
