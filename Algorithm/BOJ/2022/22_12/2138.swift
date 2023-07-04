//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/23.
//
// 2138 : 전구와 스위치
// https://www.acmicpc.net/problem/2138

import Foundation

// 입력
let n = Int(readLine()!)!
let input = readLine()!.map{ Int(String($0))! }
let target = readLine()!.map{ Int(String($0))! }

// 풀이
func toggle(_ arr: inout [Int], _ idx: Int) {
    arr[idx] = arr[idx] == 0 ? 1 : 0
}

func solve(_ arr: inout [Int]) -> Int {
    var count = 0
    for i in 1 ..< n {
        if arr[i-1] != target[i-1] {
            count += 1
            toggle(&arr, i-1)
            toggle(&arr, i)
            if i+1 < n {
                toggle(&arr, i+1)
            }
        }
    }
    
    if arr[n-1] == target[n-1] {
        return count
    } else {
        return Int(1e9)
    }
}

// 1. 첫번째 버튼 안 눌렀을 때
var unpushedArr = input
var count1 = solve(&unpushedArr)

// 2. 첫번째 버튼 눌렀을 때
var pushedArr = input
toggle(&pushedArr, 0)
toggle(&pushedArr, 1)
var count2 = solve(&pushedArr) + 1

// 출력
let result = min(count1, count2)
print(result != Int(1e9) ? result : -1)
