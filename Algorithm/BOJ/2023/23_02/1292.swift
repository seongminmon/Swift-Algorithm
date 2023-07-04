//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 1292 : 쉽게 푸는 문제
// https://www.acmicpc.net/problem/1292

import Foundation

let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (a,b) = (ab[0]-1, ab[1]-1)

var arr = [Int]()
var num = 1
while arr.count <= b {
    for _ in 0 ..< num {
        arr.append(num)
    }
    num += 1
}

let result = Array(arr[a...b]).reduce(0,+)
print(result)
