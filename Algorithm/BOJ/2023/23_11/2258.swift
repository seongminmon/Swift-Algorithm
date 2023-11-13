//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/12.
//
// 2258 : 정육점
// https://www.acmicpc.net/problem/2258

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

// (무게, 가격)
var arr = [(Int,Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

// 가격 기준 오름차순
// 무게 기준 내림차순
arr.sort {
    if $0.1 == $1.1 {
        return $0.0 > $1.0
    } else {
        return $0.1 < $1.1
    }
}

var ans = 0
var pre = -1
var sum = 0
for (w,p) in arr {
    if sum < m {
        if pre == p {
            ans += p
        } else {
            ans = p
            pre = p
        }
    } else {
        if pre != p && ans >= p {
            ans = p
            break
        }
    }
    sum += w
}
print(sum < m ? -1 : ans)
