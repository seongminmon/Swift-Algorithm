//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/04.
//
// 2805 : 나무 자르기
// https://www.acmicpc.net/problem/2805

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]
let m = input[1]
var arr = readLine()!.split(separator: " ").map {Int(String($0))!}

var start = 0
var end = arr.max()!
var mid = 0
var tempM = 0

while start <= end {
    mid = (start + end) / 2
    
    tempM = 0
    for i in arr {
        if i > mid {
            tempM += i - mid
        }
    }
    
    if m <= tempM {
        start = mid + 1
    } else {
        end = mid - 1
    }
}
print(end)
