//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/09.
//
// 11727 : 2*n 타일링 2
// https://www.acmicpc.net/problem/11727

import Foundation

let n = Int(readLine()!)!

// 풀이 1
var dpTable = [Int](repeating: 0, count: n+2)
dpTable[1] = 1
dpTable[2] = 3

if n > 2 {
    for i in 3 ... n {
        dpTable[i] = (dpTable[i-1] + dpTable[i-2] * 2) % 10007
    }
}
print(dpTable[n])

// 풀이 2
//var ans = 1
//
//if n > 1 {
//    for i in 2 ... n {
//        if i % 2 == 0 {
//            ans = (ans * 2 + 1) % 10007
//        } else {
//            ans = (ans * 2 - 1) % 10007
//        }
//    }
//}
//print(ans)
