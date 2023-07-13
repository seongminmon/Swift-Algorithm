//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/20.
//
// 20058 : 마법사 상어와 파이어스톰
// https://www.acmicpc.net/problem/20058

import Foundation

// 입력
let nq = readLine()!.split(separator: " ").map{ Int(String($0))! }
let powN = Int(pow(2, Double(nq[0])))
let q = nq[1]
var graph = [[Int]]()
for _ in 0 ..< powN {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}
var qList = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func rotate90(_ arr: [[Int]]) -> [[Int]] {
    var graph = [[Int]](repeating: [], count: arr.count)
    for i in stride(from: arr.count - 1, through: 0, by: -1) {
        for j in 0 ..< arr.count {
            graph[j].append(arr[i][j])
        }
    }
    return graph
}

for l in qList {
    let powL = Int(pow(2, Double(l)))
    
    // 1. + 2.
    for i in stride(from: 0, to: powN, by: powL) {
        for j in stride(from: 0, to: powN, by: powL) {
            var tempGraph = [[Int]](repeating: [Int](repeating: 0, count: powL), count: powL)
            for ii in 0 ..< powL {
                for jj in 0 ..< powL {
                    tempGraph[ii][jj] = graph[ii + i][jj + j]
                }
            }
            
            tempGraph = rotate90(tempGraph)
            
            for ii in 0 ..< powL {
                for jj in 0 ..< powL {
                    graph[ii + i][jj + j] = tempGraph[ii][jj]
                }
            }
            
        }
    }
    
    // 3.
    var count = [[Int]](repeating: [Int](repeating: 0, count: powN), count: powN)
    for i in 0 ..< powN {
        for j in 0 ..< powN {
            for d in 0 ..< 4 {
                let nx = i + dx[d]
                let ny = j + dy[d]
                
                if 0 <= nx, nx < powN, 0 <= ny, ny < powN {
                    if graph[nx][ny] > 0 {
                        count[i][j] += 1
                    }
                }
            }
        }
    }
    
    for i in 0 ..< powN {
        for j in 0 ..< powN {
            if graph[i][j] > 0, count[i][j] < 3 {
                graph[i][j] -= 1
            }
        }
    }
    
}

// 출력
// 1.
var sum = 0
for i in 0 ..< powN {
    for j in 0 ..< powN {
        sum += graph[i][j]
    }
}
print(sum)

// 2.
var iceBlocks = [[(Int,Int)]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: powN), count: powN)
for i in 0 ..< powN {
    for j in 0 ..< powN {
        if graph[i][j] == 0 {
            visited[i][j] = true
        }
    }
}

func bfs(_ arr: [[Int]], _ x: Int, _ y: Int) -> [(Int,Int)] {
    var queue = [(Int,Int)]()
    var idx = 0
    queue.append((x,y))
    visited[x][y] = true
    
    while idx < queue.count {
        let (nowx, nowy) = queue[idx]
        idx += 1
        
        for d in 0 ..< 4 {
            let nx = nowx + dx[d]
            let ny = nowy + dy[d]
            
            if 0 <= nx, nx < powN, 0 <= ny, ny < powN {
                if !visited[nx][ny], graph[nx][ny] > 0 {
                    queue.append((nx,ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    return queue
}

for i in 0 ..< powN {
    for j in 0 ..< powN {
        if !visited[i][j] {
            iceBlocks.append(bfs(graph, i, j))
        }
    }
}

var result = 0
for i in 0 ..< iceBlocks.count {
    result = max(result, iceBlocks[i].count)
}

if result == 1 {
    print(0)
} else {
    print(result)
}
