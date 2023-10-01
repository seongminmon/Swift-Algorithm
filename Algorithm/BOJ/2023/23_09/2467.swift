//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/30.
//
// 2467 : 용액
// https://www.acmicpc.net/problem/2467

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var minDiff = Int.max
var ans = [0,0]

var start = 0
var end = n-1
while start < end {
    let diff = abs(arr[start] + arr[end])
    
    // 갱신
    if minDiff > diff {
        minDiff = diff
        ans = [arr[start], arr[end]]
    }
    
    if arr[start] >= 0 && arr[end] >= 0 {
        end -= 1
    } else if arr[start] < 0 && arr[end] < 0 {
        start += 1
    } else {
        if abs(arr[start]) > arr[end] {
            start += 1
        } else {
            end -= 1
        }
    }
    
//    if arr[start] + arr[end] > 0 {
//        end -= 1
//    } else {
//        start += 1
//    }
}

print(ans[0], ans[1])
