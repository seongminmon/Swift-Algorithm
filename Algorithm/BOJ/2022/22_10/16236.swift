//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/15.
//
// 16236 : 아기 상어
// https://www.acmicpc.net/problem/16236

import Foundation

// 입력
let n = Int(readLine()!)!
var shark = (0,0,0)     // (x,y,크기)
var graph = [[Int]]()
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
    
    if let j = input.firstIndex(of: 9) {
        shark = (i,j,2)
        graph[i][j] = 0
    }
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
var eatCnt = 0
var result = 0
func bfs() -> Bool {
    var queue = [(Int,Int,Int)]()   // (x,y,거리)
    var idx = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    // 초기값
    queue.append((shark.0, shark.1, 0))
    visited[shark.0][shark.1] = true
    
    var dist = Int(1e9)
    var fishes = [(Int,Int)]()
    
    while idx < queue.count {
        let (x,y,cnt) = queue[idx]
        idx += 1
        
        if cnt > dist {
            continue
        }
        
        // 물고기 후보
        if 1 <= graph[x][y], graph[x][y] < shark.2 {
            dist = cnt
            fishes.append((x,y))
        }
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            // 범위 내, 이동 가능, 미방문
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               graph[nx][ny] <= shark.2, !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx, ny, cnt+1))
            }
        }
    }
    
    // 먹을 물고기 없을 시 종료
    if fishes.isEmpty {
        return false
    }
    
    // 우선 순위에 따라 정렬
    fishes.sort { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 }
    
    // 잡아 먹기
    let fish = fishes.first!
    eatCnt += 1
    if eatCnt == shark.2 {
        shark.2 += 1
        eatCnt = 0
    }
    shark = (fish.0, fish.1, shark.2)
    graph[fish.0][fish.1] = 0
    
    result += dist
    return true
}

// 출력
while true {
    if !bfs() {
        print(result)
        break
    }
}
