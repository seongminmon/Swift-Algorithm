//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/30.
//
// 10819 : 차이를 최대로
// https://www.acmicpc.net/problem/10819

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = Int.min
var visited = [Bool](repeating: false, count: n)
func permutation(_ depth: Int, _ perm: [Int]) {
    if depth == n {
        var value = 0
        for i in 0..<n-1 {
            value += abs(arr[perm[i]] - arr[perm[i+1]])
        }
        ans = max(ans, value)
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            permutation(depth+1, perm + [i])
            visited[i] = false
        }
    }
}

permutation(0, [])
print(ans)
