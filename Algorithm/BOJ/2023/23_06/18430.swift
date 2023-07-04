//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/07.
//
// 18430 : 무기 공학
// https://www.acmicpc.net/problem/18430

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

func isPossible(_ pos: (Int,Int,Int,Int)) -> Bool {
    return (0..<n).contains(pos.0) && (0..<m).contains(pos.1) &&
    (0..<n).contains(pos.2) && (0..<m).contains(pos.3) &&
    !visited[pos.0][pos.1] && !visited[pos.2][pos.3]
}

var ans = 0
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
func dfs(_ x: Int, _ y: Int, _ sum: Int) {
    var (x,y) = (x,y)
    if y == m {
        y = 0
        x += 1
    }

    if x == n {
        ans = max(ans, sum)
        return
    }

    if !visited[x][y] {
        let positions = [(x,y-1,x+1,y), (x,y-1,x-1,y), (x-1,y,x,y+1), (x+1,y,x,y+1)]
        for pos in positions {
            if isPossible(pos) {
                visited[x][y] = true
                visited[pos.0][pos.1] = true
                visited[pos.2][pos.3] = true
                
                dfs(x, y+1, sum + graph[x][y] * 2 + graph[pos.0][pos.1] + graph[pos.2][pos.3])
                
                visited[x][y] = false
                visited[pos.0][pos.1] = false
                visited[pos.2][pos.3] = false
            }
        }
    }
    dfs(x, y+1, sum)
}

dfs(0, 0, 0)

print(ans)
