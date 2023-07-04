//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/02.
//
// 10971 : 외판원 순회 2
// https://www.acmicpc.net/problem/10971

import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let MAX = Int(1e9)
for i in 0 ..< n {
    for j in 0 ..< n {
        if graph[i][j] == 0 {
            graph[i][j] = MAX
        }
    }
}

var permutation = Array(0 ..< n)
var result = Int.max
func dfs(_ depth: Int) {
    // 종료 조건
    if depth == n-1 {
        permutation.append(permutation[0])
        
        var sum = 0
        for i in 0 ..< n {
            let dist = graph[permutation[i]][permutation[i+1]]
            if dist == MAX {
                permutation.removeLast()
                return
            } else {
                sum += dist
            }
        }
        result = min(result, sum)
        
        permutation.removeLast()
        return
    }
    
    for i in depth ..< n {
        permutation.swapAt(i, depth)
        dfs(depth + 1)
        permutation.swapAt(i, depth)
    }
}

dfs(0)

// 출력
print(result)
