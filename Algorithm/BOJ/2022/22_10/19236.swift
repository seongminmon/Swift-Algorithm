//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/17.
//
// 19236 : 청소년 상어
// https://www.acmicpc.net/problem/19236

import Foundation

// 입력
let n = 4
var graph = [[(Int,Int)]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in stride(from: 0, to: n*2, by: 2) {
        graph[i].append((input[j], input[j+1] - 1))
    }
}

// 풀이
// ↑, ↖, ←, ↙, ↓, ↘, →, ↗
let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let dy = [0, -1, -1, -1, 0, 1, 1, 1]

func findFish(_ arr: [[(Int,Int)]], _ size: Int) -> (Int,Int)? {
    for i in 0 ..< n {
        for j in 0 ..< n {
            if arr[i][j].0 == size {
                return (i,j)
            }
        }
    }
    return nil
}

func moveFish(_ arr: [[(Int,Int)]], _ shark: (Int,Int)) -> [[(Int,Int)]] {
    var graph = arr
    for i in 1 ... n*n {
        if let target = findFish(graph, i) {
            let (x,y) = (target.0, target.1)
            
            for _ in 0 ..< 8 {
                let nx = x + dx[graph[x][y].1]
                let ny = y + dy[graph[x][y].1]
                
                if 0 <= nx, nx < n, 0 <= ny, ny < n,
                   !(nx == shark.0 && ny == shark.1) {
                    let temp = graph[x][y]
                    graph[x][y] = graph[nx][ny]
                    graph[nx][ny] = temp
                    break
                }
                graph[x][y].1 = (graph[x][y].1 + 1) % 8
            }
        }
    }
    return graph
}

func eatableFishes(_ arr: [[(Int,Int)]], _ shark: (Int,Int)) -> [(Int,Int)] {
    let direction = arr[shark.0][shark.1].1
    var (nx,ny) = (shark.0, shark.1)
    
    var fishes = [(Int,Int)]()
    for _ in 1 ... 3 {
        nx += dx[direction]
        ny += dy[direction]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < n,
           arr[nx][ny].0 != 0 {
            fishes.append((nx,ny))
        }
    }
    return fishes
}

func dfs(_ arr: [[(Int,Int)]], _ shark: (Int,Int), _ total: Int) {
    var graph = arr
    var total = total
    
    // 잡아먹고 빈칸 만들기
    total += graph[shark.0][shark.1].0
    graph[shark.0][shark.1].0 = 0
    
    // 물고기 이동
    graph = moveFish(graph, shark)
    
    // 물고기 후보들
    let fishes = eatableFishes(graph, shark)
    
    // 없으면 종료
    if fishes.isEmpty {
        result = max(result, total)
        return
    }
    
    // 재귀
    for i in 0 ..< fishes.count {
        dfs(graph, fishes[i], total)
    }
}

var result = 0
dfs(graph, (0,0), 0)

// 출력
print(result)
