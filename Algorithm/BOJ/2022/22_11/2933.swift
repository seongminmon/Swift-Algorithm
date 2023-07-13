//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/28.
//
// 2933 : 미네랄
// https://www.acmicpc.net/problem/2933

import Foundation

// 입력
let rc = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (r,c) = (rc[0], rc[1])

var graph = [[String]]()
for _ in 0 ..< r {
    let input = readLine()!.map{ String($0) }
    graph.append(input)
}

let n = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map{ r - Int(String($0))! }

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

// n번의 막대기 던지기
for i in 0 ..< n {
    // 높이에 미네랄 있는지 확인
    var idx: Int?
    if i % 2 == 0 {
        idx = graph[heights[i]].firstIndex(of: "x")
    } else {
        idx = graph[heights[i]].lastIndex(of: "x")
    }
    if idx == nil { continue }
    
    // 1. 미네랄 제거
    let x = heights[i]
    let y = idx!
    graph[x][y] = "."
    
    // 2. 상하좌우 확인하고 떠있는 미네랄 있다면 떨어뜨리기
    for d in 0 ..< 4 {
        let nx = x + dx[d]
        let ny = y + dy[d]
        
        // 범위 내에 있고, 미네랄이어야 함
        if 0 <= nx, nx < r, 0 <= ny, ny < c,
           graph[nx][ny] == "x" {
            if let minerals = bfs(nx, ny) {
                downMinerals(minerals)
            }
        }
    }
    
}

func bfs(_ x: Int, _ y: Int) -> [(Int,Int)]? {
    var queue = [(Int,Int)]()
    var idx = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
    
    queue.append((x,y))
    visited[x][y] = true
    
    while idx < queue.count {
        let (nowx, nowy) = queue[idx]
        idx += 1
        
        // 땅에 닿아 있으면
        if nowx == r - 1 {
            return nil
        }
        
        for d in 0 ..< 4 {
            let nx = nowx + dx[d]
            let ny = nowy + dy[d]
            
            // 범위 내에 있고, 미네랄이어야 하고, 방문 안 했어야 함
            if 0 <= nx, nx < r, 0 <= ny, ny < c,
               graph[nx][ny] == "x", !visited[nx][ny] {
                queue.append((nx,ny))
                visited[nx][ny] = true
            }
        }
    }
    
    return queue
}

func downMinerals(_ minerals: [(Int,Int)]) {
    // 기존의 미네랄 제거
    for (x,y) in minerals {
        graph[x][y] = "."
    }
    
    // 얼만큼 내릴지 고려
    for dist in 1 ... r {
        // 움직일 수 있으면 거리 1 증가시켜 봄
        var check = true
        for (x, y) in minerals {
            // 범위 밖이거나 다른 미네랄과 겹치면 불가능
            if x + dist < 0 || x + dist >= r || y < 0 || y >= c ||
                graph[x + dist][y] == "x" {
                check = false
            }
        }
        
        // 움직일 수 없으면 직전 dist로 이동 후 종료
        if !check {
            for (x,y) in minerals {
                graph[x + dist - 1][y] = "x"
            }
            break
        }
    }
    
}

// 출력
for g in graph {
    print(g.joined())
}
