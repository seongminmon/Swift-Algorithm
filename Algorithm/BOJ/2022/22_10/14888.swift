//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/12.
//
// 14888 : 연산자 끼워넣기
// https://www.acmicpc.net/problem/14888

import Foundation

// 입력
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var op = readLine()!.split(separator: " ").map { Int(String($0))! }

// 풀이
var MAX = -(Int(1e9))
var MIN = Int(1e9)

func dfs(_ depth: Int, _ value: Int) {
    // 종료 조건
    if depth == n {
        MAX = max(MAX, value)
        MIN = min(MIN, value)
        return
    }
    
    for i in 0 ..< 4 {
        if op[i] > 0 {
            op[i] -= 1
            
            var nextValue = 0
            switch i {
            case 0: nextValue = value + arr[depth]
            case 1: nextValue = value - arr[depth]
            case 2: nextValue = value * arr[depth]
            default : nextValue = value / arr[depth]
            }
            
            dfs(depth+1, nextValue)
            op[i] += 1
        }
    }
}

dfs(1, arr[0])

// 출력
print(MAX)
print(MIN)
