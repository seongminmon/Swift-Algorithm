//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/17.
//
// 20056 : 마법사 상어와 파이어볼
// https://www.acmicpc.net/problem/20056

import Foundation

// 입력
let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

// (x, y, 질량, 속력, 방향)
var fireballs = [(Int,Int,Int,Int,Int)]()
for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    fireballs.append((input[0] - 1, input[1] - 1, input[2], input[3], input[4]))
}

// 풀이
let dx = [-1, -1, 0, 1, 1, 1, 0, -1]
let dy = [0, 1, 1, 1, 0, -1, -1, -1]

for _ in 0 ..< k {
    // 1.
    for i in 0 ..< fireballs.count {
        // (x, y, 질량, 속력, 방향)
        var (x, y, _, s, d) = fireballs[i]
        
        x += (dx[d] * s) % n
        y += (dy[d] * s) % n
        
        if x < 0 {
            x += n
        } else if x >= n {
            x -= n
        }
        
        if y < 0 {
            y += n
        } else if y >= n {
            y -= n
        }
        
        fireballs[i].0 = x
        fireballs[i].1 = y
    }
    
    // 2.
    // (질량, 속력, 방향)
    var graph = [[[(Int,Int,Int)]]](repeating: [[(Int,Int,Int)]](repeating: [], count: n), count: n)
    for (x,y,m,s,d) in fireballs {
        graph[x][y].append((m,s,d))
    }
    
    for i in 0 ..< n {
        for j in 0 ..< n {
            if graph[i][j].count >= 2 {
                var sumM = 0
                var sumS = 0
                let cnt = graph[i][j].count
                var evenCnt = 0
                var oddCnt = 0
                
                // 하나로 합치기
                for _ in 0 ..< graph[i][j].count {
                    let (m,s,d) = graph[i][j].removeLast()
                    sumM += m
                    sumS += s
                    if d % 2 == 0 { evenCnt += 1 }
                    else { oddCnt += 1 }
                }
                
                // 4개로 나누기
                for k in stride(from: 1, through: 7, by: 2) {
                    // 질량이 0이면 소멸
                    if sumM / 5 != 0 {
                        if evenCnt == cnt || oddCnt == cnt {
                            graph[i][j].append((sumM / 5, sumS / cnt, k-1))
                        } else {
                            graph[i][j].append((sumM / 5, sumS / cnt, k))
                        }
                    }
                }
                
            }
        }
    }
    
    // 파이어볼 초기화
    fireballs.removeAll()
    for i in 0 ..< n {
        for j in 0 ..< n {
            for k in 0 ..< graph[i][j].count {
                let (m, s, d) = graph[i][j][k]
                fireballs.append((i, j, m, s, d))
            }
        }
    }
    
}

// 출력
var result = 0
for f in fireballs {
    result += f.2
}
print(result)
