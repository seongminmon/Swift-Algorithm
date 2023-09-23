//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/13.
//
// 2470 : 두 용액
// https://www.acmicpc.net/problem/2470

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
arr.sort()

var value = Int.max
var ans = [-1, -1]

var start = 0
var end = n-1
while start < end {
    let temp = abs(arr[start] + arr[end])
    
    // 갱신
    if value > temp {
        value = temp
        ans = [arr[start], arr[end]]
    }
    
    // 포인터 이동
    if arr[start] < 0 && arr[end] < 0 {
        start += 1
    } else if arr[start] < 0 && arr[end] >= 0 {
        if abs(arr[start]) > arr[end] {
            start += 1
        } else {
            end -= 1
        }
    } else {
        end -= 1
    }
}

print(ans[0], ans[1])
