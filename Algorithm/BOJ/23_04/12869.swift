//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 12869 : 뮤탈리스크
// https://www.acmicpc.net/problem/12869

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var scv = [0,0,0]
for i in 0 ..< n { scv[i] = input[i] }

func bfs() -> Int {
    var visited = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.max, count: 61), count: 61), count: 61)
    var queue = [(Int,Int,Int)]()
    var idx = 0
    
    visited[scv[0]][scv[1]][scv[2]] = 0
    queue.append((scv[0],scv[1],scv[2]))
    
    let dscv = [[1,3,9],[1,9,3],[3,1,9],[3,9,1],[9,1,3],[9,3,1]]
    
    while idx < queue.count {
        let (now1, now2, now3) = queue[idx]
        idx += 1
        
        if now1 == 0, now2 == 0, now3 == 0 {
            break
        }
        
        for i in 0 ..< 6 {
            var next1 = now1 - dscv[i][0]
            var next2 = now2 - dscv[i][1]
            var next3 = now3 - dscv[i][2]
            
            if next1 < 0 { next1 = 0 }
            if next2 < 0 { next2 = 0 }
            if next3 < 0 { next3 = 0 }
            
            if visited[next1][next2][next3] == Int.max {
                visited[next1][next2][next3] = visited[now1][now2][now3] + 1
                queue.append((next1, next2, next3))
            }
        }
    }
    
    return visited[0][0][0]
}

print(bfs())
