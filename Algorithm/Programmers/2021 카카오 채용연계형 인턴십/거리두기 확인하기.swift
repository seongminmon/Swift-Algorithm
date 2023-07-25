//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/05.
//
// 거리두기 확인하기
// 2021 카카오 채용연계형 인턴십
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/81302

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var map = [[[String]]](repeating: [[String]](repeating: [], count: 5), count: 5)
    for i in 0..<5 {
        for j in 0..<5 {
            map[i][j] = places[i][j].map { String($0) }
        }
    }
    
    func bfs(_ start: (Int,Int), _ map: [[String]]) -> [[Int]] {
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        
        var dist = [[Int]](repeating: [Int](repeating: Int.max, count: 5), count: 5)
        dist[start.0][start.1] = 0
        var queue = [(start.0, start.1)]
        var idx = 0
        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0 <= nx, nx < 5, 0 <= ny, ny < 5,
                   dist[nx][ny] == Int.max, map[nx][ny] != "X" {
                    dist[nx][ny] = dist[x][y] + 1
                    queue.append((nx,ny))
                }
            }
        }
        
        return dist
    }
    
    var result = [Int]()
    outerLoop: for k in 0..<5 {
        var people = [(Int,Int)]()
        for i in 0..<5 {
            for j in 0..<5 {
                if map[k][i][j] == "P" {
                    people.append((i,j))
                }
            }
        }
        
        for i in 0..<people.count {
            let dist = bfs(people[i], map[k])
            for j in 0..<people.count {
                if i == j { continue }
                if dist[people[j].0][people[j].1] <= 2 {
                    result.append(0)
                    continue outerLoop
                }
            }
        }
        result.append(1)
    }
        
    return result
}

print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
