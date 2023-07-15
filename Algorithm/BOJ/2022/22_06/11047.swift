//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/20.
//
// 11047 : 동전 0
// https://www.acmicpc.net/problem/11047

import Foundation

let input1 = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input1[0]
var k = input1[1]

var coins = [Int]()
for _ in 1...n {
    coins.append(Int(readLine()!)!)
}

coins.reverse()

var cnt = 0
var i = 0
while k > 0 && i < coins.count {
    if coins[i] <= k {
        k -= coins[i]
        cnt += 1
    } else {
        i += 1
    }
}

print(cnt)
