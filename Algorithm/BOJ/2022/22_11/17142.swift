//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/11.
//
// 17142 : 연구소 3
// https://www.acmicpc.net/problem/17142

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
var zeroCnt = 0
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var virus = [(Int,Int)]()
for i in 0 ..< n {
    for j in 0 ..< n {
        if graph[i][j] == 0 {
            zeroCnt += 1
        } else if graph[i][j] == 1 {
            visited[i][j] = true
        } else if graph[i][j] == 2 {
            virus.append((i,j))
        }
    }
}

var virusVisited = [Bool](repeating: false, count: virus.count)
var result = Int(1e9)
func dfs(_ depth: Int, _ start: Int) {
    // 종료 조건
    if depth == m {
        var selectedVirus = [(Int,Int)]()
        for i in 0 ..< virus.count {
            if virusVisited[i] {
                selectedVirus.append(virus[i])
            }
        }
        
        result = min(result, bfs(selectedVirus))
        return
    }
    
    // m개의 바이러스 선택
    for i in start ..< virus.count {
        if !virusVisited[i] {
            virusVisited[i] = true
            dfs(depth + 1, i)
            virusVisited[i] = false
        }
    }
    
}

func bfs(_ selectedVirus: [(Int,Int)]) -> Int {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var queue = selectedVirus
    var idx = 0
    
    var infectionCnt = 0
    var tempGraph = graph
    
    // 선택된 바이러스 방문 표시
    var tempVisited = visited
    for i in 0 ..< virus.count {
        if virusVisited[i] {
            tempVisited[virus[i].0][virus[i].1] = true
        }
    }
    
    var cnt = 0
    var nextQueue = [(0,0)]
    while !nextQueue.isEmpty {
        // 종료 조건 : 모든 빈칸을 다 채웠을 시
        if infectionCnt == zeroCnt {
            return cnt
        }
        
        nextQueue = [(Int,Int)]()
        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1
            
            for d in 0 ..< 4 {
                let nx = x + dx[d]
                let ny = y + dy[d]
                
                if 0 <= nx, nx < n, 0 <= ny, ny < n {
                    if !tempVisited[nx][ny] {
                        if tempGraph[nx][ny] == 0 {
                            infectionCnt += 1
                        }
                        
                        tempGraph[nx][ny] = 2
                        tempVisited[nx][ny] = true
                        nextQueue.append((nx,ny))
                    }
                }
            }
        }
        
        queue = nextQueue
        idx = 0
        cnt += 1
    }

    // 중간에 종료되지 않고 다 돌았으면 어떻게 해도 못 채운다는 뜻임
    return Int(1e9)
}

dfs(0, 0)

// 출력
if result == Int(1e9) {
    print(-1)
} else {
    print(result)
}
