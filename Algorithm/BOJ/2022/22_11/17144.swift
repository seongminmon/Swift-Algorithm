//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/08.
//
// 17144 : 미세먼지 안녕!
// https://www.acmicpc.net/problem/17144

import Foundation

// 입력
let rct = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (r,c,t) = (rct[0], rct[1], rct[2])

var graph = [[Int]]()
var airCleaner2 = (0,0)
for i in 0 ..< r {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    if input[0] == -1 {
        airCleaner2 = (i, 0)
    }
    graph.append(input)
}
var airCleaner1 = (airCleaner2.0 - 1, 0)

// 풀이
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

for _ in 0 ..< t {
    // 1. 미세먼지 확산
    var addGraph = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
    for i in 0 ..< r {
        for j in 0 ..< c {
            // 미세먼지 있을 시
            if graph[i][j] > 0 {
                var cnt = 0
                for d in 0 ..< 4 {
                    let nx = i + dx[d]
                    let ny = j + dy[d]
                    
                    if 0 <= nx, nx < r, 0 <= ny, ny < c {
                        if graph[nx][ny] != -1 {
                            addGraph[nx][ny] += graph[i][j] / 5
                            cnt += 1
                        }
                    }
                }
                graph[i][j] -= graph[i][j] / 5 * cnt
            }
        }
    }
    
    for i in 0 ..< r {
        for j in 0 ..< c {
            graph[i][j] += addGraph[i][j]
        }
    }
    
    // 2. 공기청정기 작동
    // (1) 위쪽
    // 역순으로 구현
    var (x,y) = airCleaner1
    x -= 1
    graph[x][y] = 0
    
    // 1. 내려가기
    while (x,y) != (0, 0) {
        graph[x][y] = graph[x-1][y]
        x -= 1
    }
    // 2. 왼쪽으로 가기
    while (x,y) != (0, c-1) {
        graph[x][y] = graph[x][y+1]
        y += 1
    }
    
    // 3. 올라가기
    while (x,y) != (airCleaner1.0, c-1) {
        graph[x][y] = graph[x+1][y]
        x += 1
    }
    
    // 4. 오른쪽으로 가기
    while (x,y) != airCleaner1 {
        graph[x][y] = graph[x][y-1]
        y -= 1
    }
    graph[x][y+1] = 0
    
    // (2) 아래쪽
    (x,y) = airCleaner2
    x += 1
    graph[x][y] = 0
    
    // 1. 올라가기
    while (x,y) != (r-1, 0) {
        graph[x][y] = graph[x+1][y]
        x += 1
    }
    // 2. 왼쪽으로 가기
    while (x,y) != (r-1, c-1) {
        graph[x][y] = graph[x][y+1]
        y += 1
    }
    
    // 3. 내려가기
    while (x,y) != (airCleaner2.0, c-1) {
        graph[x][y] = graph[x-1][y]
        x -= 1
    }
    
    // 4. 오른쪽으로 가기
    while (x,y) != airCleaner2 {
        graph[x][y] = graph[x][y-1]
        y -= 1
    }
    graph[x][y+1] = 0
}

// 출력
var result = 0
for i in 0 ..< r {
    for j in 0 ..< c {
        if graph[i][j] > 0 {
            result += graph[i][j]
        }
    }
}
print(result)
