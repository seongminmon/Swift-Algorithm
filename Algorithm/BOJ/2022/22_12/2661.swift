//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/06.
//
// 2661 : 좋은수열
// https://www.acmicpc.net/problem/2661

import Foundation

// 입력
let n = Int(readLine()!)!

// 풀이
var list = ["1"]
var result = ""

func dfs(_ depth : Int) {
    if result != "" {
        return
    }
    
    // 종료 조건
    if depth == n {
        result = list.reduce("", +)
        return
    }
    
    for i in 1 ... 3 {
        list.append(String(i))
        if isGood(list) {
            dfs(depth+1)
        }
        list.removeLast()
    }
    
}

func isGood(_ str: [String]) -> Bool {
    for i in 1 ... str.count / 2 {
        let left = str[str.count - 2*i ..< str.count - i]
        let right = str[str.count - i ..< str.count]
        
        if left == right {
            return false
        }
    }
    
    return true
}

dfs(1)

// 출력
print(result)
