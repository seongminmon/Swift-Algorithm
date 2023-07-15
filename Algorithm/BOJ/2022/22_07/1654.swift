//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/04.
//
// 1654 : 랜선 자르기
// https://www.acmicpc.net/problem/1654

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let k = input[0]
let n = input[1]
var arr = [Int]()
for _ in 0 ..< k {
    arr.append(Int(readLine()!)!)
}

var start = 1
var end = arr.max()!
var mid = 0
var tempN = 0

while start <= end {
    mid = (start + end) / 2
    
    tempN = 0
    for i in arr {
        tempN += i / mid
    }
    
    if n <= tempN {
        start = mid + 1
    } else {
        end = mid - 1
    }
}
print(end)
