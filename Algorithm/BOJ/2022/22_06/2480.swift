//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/20.
//
// 2480 : 주사위 세개
// https://www.acmicpc.net/problem/2480

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let a = input[0]
let b = input[1]
let c = input[2]

if a==b && b==c {
    print(10000 + a*1000)
} else if a==b || c==a {
    print(1000 + a*100)
} else if b==c {
    print(1000 + b*100)
} else {
    print(max(a, b, c)*100)
}

