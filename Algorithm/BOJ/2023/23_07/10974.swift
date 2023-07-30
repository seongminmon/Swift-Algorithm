//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/30.
//
// 10974 : 모든 순열
// https://www.acmicpc.net/problem/10974

import Foundation

let n = Int(readLine()!)!

var visited = [Bool](repeating: false, count: n+1)
func permutation(_ perm: [Int]) {
    if perm.count == n {
        print(perm.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            permutation(perm + [i])
            visited[i] = false
        }
    }
}
permutation([])
