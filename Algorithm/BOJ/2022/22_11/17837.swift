//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/25.
//
// 17837 : 새로운 게임 2
// https://www.acmicpc.net/problem/17837

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var horses = [(Int,Int,Int)]()
var horsesInGraph = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: n)
for i in 0 ..< k {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    horses.append((input[0] - 1, input[1] - 1, input[2]))
    horsesInGraph[input[0] - 1][input[1] - 1].append(i)
}

// 풀이
// 좌, 우, 상, 하
let dx = [0, 0, 0, -1, 1]
let dy = [0, 1, -1, 0, 0]

var result = 0
outerLoop: for cnt in 1 ... 1000 {
    // 모든 말 순서대로 이동
    for i in 0 ..< k {
        var (x, y, d) = horses[i]
        
        var nx = x + dx[d]
        var ny = y + dy[d]
        
        // 1. 영역 밖이거나 파란색
        if (nx < 0 || nx >= n || ny < 0 || ny >= n) || graph[nx][ny] == 2 {
            if d == 1 || d == 3 {
                d += 1
            } else {
                d -= 1
            }
            nx = x + dx[d]
            ny = y + dy[d]
            horses[i].2 = d
            // 또 다시 영역 밖이거나 파란색
            if (nx < 0 || nx >= n || ny < 0 || ny >= n) || graph[nx][ny] == 2 {
                continue
            }
        }
        
        // 2 + 3. 흰색 + 빨간색
        let idx = horsesInGraph[x][y].firstIndex(of: i)!
        var tempHorses = Array(horsesInGraph[x][y][idx...])
        
        // 빨간색이면 거꾸로 추가
        if graph[nx][ny] == 1 {
            tempHorses.reverse()
        }
        // 흰색이면 그대로 추가
        horsesInGraph[nx][ny].append(contentsOf: tempHorses)
        
        // 종료 조건
        if horsesInGraph[nx][ny].count >= 4 {
            result = cnt
            break outerLoop
        }
        
        // 이동 + 삭제
        for j in tempHorses {
            horses[j].0 = nx
            horses[j].1 = ny
            horsesInGraph[x][y].removeLast()
        }
        
    }
}

// 출력
print(result == 0 ? -1 : result)
