//
//  mian.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/12.
//
// 14620 : 꽃길
// https://www.acmicpc.net/problem/14620

import Foundation

// 입력
let n = Int(readLine()!)!
var board = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    board.append(input)
}

// 풀이
let dx = [0,0,0,1,-1]
let dy = [0,1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var result = Int(1e9)
func dfs(_ depth: Int, _ select: [(Int,Int)]) {
    // 종료 조건
    if depth == 3 {
        var sum = 0
        for (i,j) in select {
            for k in 0 ..< 5 {
                let ni = i + dx[k]
                let nj = j + dy[k]
                sum += board[ni][nj]
            }
        }
        
        result = min(result, sum)
        return
    }
    
    for i in 1 ..< n-1 {
        for j in 1 ..< n-1 {
            var visit = false
            for k in 0 ..< 5 {
                let ni = i + dx[k]
                let nj = j + dy[k]
                
                if visited[ni][nj] {
                    visit = true
                    break
                }
            }
            if !visit {
                for k in 0 ..< 5 {
                    let ni = i + dx[k]
                    let nj = j + dy[k]
                    visited[ni][nj] = true
                }
                dfs(depth+1, select + [(i,j)])
                for k in 0 ..< 5 {
                    let ni = i + dx[k]
                    let nj = j + dy[k]
                    visited[ni][nj] = false
                }
            }
        }
    }
}

dfs(0, [])
print(result)
