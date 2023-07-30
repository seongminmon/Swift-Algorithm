//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/30.
//
// 1759 : 암호 만들기
// https://www.acmicpc.net/problem/1759

import Foundation

let lc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (l,c) = (lc[0], lc[1])
var arr = readLine()!.split(separator: " ").map { String($0) }
arr.sort()

let vowels = ["a", "e", "i", "o", "u"]
var visited = [Bool](repeating: false, count: c)
func dfs(_ depth: Int, _ start: Int, _ temp: [String]) {
    if depth == l {
        var vowelCnt = 0
        var consonantCnt = 0
        for t in temp {
            if vowels.contains(t) {
                vowelCnt += 1
            } else {
                consonantCnt += 1
            }
        }
        
        if vowelCnt >= 1 && consonantCnt >= 2 {
            print(temp.joined())
        }
        return
    }
    
    for i in start..<c {
        if !visited[i] {
            visited[i] = true
            dfs(depth+1, i, temp + [arr[i]])
            visited[i] = false
        }
    }
}

dfs(0, 0, [])
