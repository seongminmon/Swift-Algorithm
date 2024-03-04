//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/24/24.
//
// 17406 : 배열 돌리기 4
// https://www.acmicpc.net/problem/17406

import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

var orders = [[Int]]()
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    orders.append(input)
}

func rotate(_ order: [Int], _ graph: [[Int]]) -> [[Int]] {
    var nextGraph = graph
    let (r,c,s) = (order[0]-1, order[1]-1, order[2])
    
    for i in 1...s {
        // 위
        for j in c-i..<c+i {
            nextGraph[r-i][j+1] = graph[r-i][j]
        }
        
        // 아래
        for j in (c-i+1...c+i).reversed() {
            nextGraph[r+i][j-1] = graph[r+i][j]
        }
        
        // 오른쪽
        for j in r-i..<r+i {
            nextGraph[j+1][c+i] = graph[j][c+i]
        }
        
        // 왼쪽
        for j in (r-i+1...r+i).reversed() {
            nextGraph[j-1][c-i] = graph[j][c-i]
        }
    }
    
    return nextGraph
}

var ans = Int.max
var permutation = Array(0..<k)
func dfs(_ depth: Int) {
    if depth == k {
        var graph = graph
        for i in permutation {
            graph = rotate(orders[i], graph)
        }
        
        for i in 0..<n {
            ans = min(ans, graph[i].reduce(0, +))
        }
        return
    }
    
    for i in depth..<k {
        permutation.swapAt(i, depth)
        dfs(depth+1)
        permutation.swapAt(i, depth)
    }
}

dfs(0)

print(ans)
