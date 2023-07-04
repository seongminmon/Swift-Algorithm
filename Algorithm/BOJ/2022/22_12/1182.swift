//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/05.
//
// 1182 : 부분수열의 합
// https://www.acmicpc.net/problem/1182

import Foundation

// 입력
let ns = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,s) = (ns[0], ns[1])
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
var visited = [Bool](repeating: false, count: n)
var result = 0
func dfs(_ depth: Int, _ start: Int, _ sum: Int, _ num: Int) {
    // 종료 조건
    if depth == num {
        if sum == s {
            result += 1
        }
        return
    }
    
    for i in start ..< n {
        if !visited[i] {
            visited[i] = true
            dfs(depth+1, i, sum + arr[i], num)
            visited[i] = false
        }
    }
    
}

for i in 1 ... n {
    dfs(0, 0, 0, i)
}

// 출력
print(result)
