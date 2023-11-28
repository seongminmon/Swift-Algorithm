//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 1940 : 주몽
// https://www.acmicpc.net/problem/1940

import Foundation

// 풀이 1: Dictionary
let n = Int(readLine()!)!
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var dict = [Int: Int]()
var cnt = 0
for num in arr {
    if dict[m-num] != nil {
        dict[m-num]! -= 1
        if dict[m-num]! == 0 {
            dict[m-num] = nil
        }
        cnt += 1
    } else {
        dict[num, default: 0] += 1
    }
}
print(cnt)

// 풀이 2: 투 포인터
//let n = Int(readLine()!)!
//let m = Int(readLine()!)!
//let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
//
//var cnt = 0
//var s = 0
//var e = n-1
//while s < e {
//    let sum = arr[s] + arr[e]
//    if sum == m {
//        cnt += 1
//        s += 1
//        e -= 1
//    } else if sum < m {
//        s += 1
//    } else {
//        e -= 1
//    }
//}
//print(cnt)
