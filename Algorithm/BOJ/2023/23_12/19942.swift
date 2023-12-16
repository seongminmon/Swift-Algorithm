//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/11/23.
//
// 19942 : 다이어트
// https://www.acmicpc.net/problem/19942

import Foundation

let n = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map { Int(String($0))! }
var arr = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}

var minCost = Int.max
var ans = ""

func check(_ temp: [Int]) -> Bool {
    for i in 0..<4 {
        if temp[i] < target[i] {
            return false
        }
    }
    return true
}

for bitmask in 1..<(1 << n) {
    var nextAns = ""
    var cost = 0
    var temp = [0,0,0,0]
    
    for idx in 0..<n {
        if bitmask & (1 << idx) != 0 {
            nextAns += "\(idx+1) "
            cost += arr[idx][4]
            for i in 0..<4 {
                temp[i] += arr[idx][i]
            }
        }
    }
    
    guard minCost >= cost && check(temp) else { continue }
    
    if minCost == cost {
        if ans > nextAns {
            ans = nextAns
        }
    } else {
        minCost = cost
        ans = nextAns
    }
}

if minCost == Int.max {
    print(-1)
} else {
    print(minCost)
    print(ans)
}
