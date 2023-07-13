//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/16.
//
// 21610 : 마법사 상어와 비바라기
// https://www.acmicpc.net/problem/21610

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}
var operation = [(Int,Int)]()   // (뱡향, 거리)
for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    operation.append((input[0], input[1]))
}

// 풀이
// 방향 1~8
let dx = [0, 0, -1, -1, -1, 0, 1, 1, 1]
let dy = [0, -1, -1, 0, 1, 1, 1, 0, -1]

// 비바라기 시전
var cloud = [(Int,Int)]()
cloud.append((n-1,0))
cloud.append((n-1,1))
cloud.append((n-2,0))
cloud.append((n-2,1))

for (d, s) in operation {
    // 1. 모든 구름 명령에 따라 이동
    for i in 0 ..< cloud.count {
        cloud[i].0 += (dx[d] * s) % n
        cloud[i].1 += (dy[d] * s) % n
        
        // 인덱스 범위 넘어가는 것 처리
        if cloud[i].0 < 0 {
            cloud[i].0 += n
        } else if cloud[i].0 >= n {
            cloud[i].0 -= n
        }
        
        if cloud[i].1 < 0 {
            cloud[i].1 += n
        } else if cloud[i].1 >= n {
            cloud[i].1 -= n
        }
        
        // 2. 각 구름에서 비가 내려 그 칸의 물의 양 1증가
        graph[cloud[i].0][cloud[i].1] += 1
    }
    
    // 3. 구름 모두 사라짐
    // 4. 물복사 버그
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for _ in 0 ..< cloud.count {
        let (x,y) = cloud.removeLast()
        
        // 대각선 방향
        // d: 2, 4, 6, 8
        for j in stride(from: 2, through: 8, by: 2) {
            let nx = x + dx[j]
            let ny = y + dy[j]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n {
                if graph[nx][ny] > 0 {
                    graph[x][y] += 1
                }
            }
        }
        
        visited[x][y] = true
    }

    
    // 5. 2 이상인 칸에 구름 생성, 물의 양 2 줄어듬
    // 3번에서 사라진 애들이 아니어야 함
    for i in 0 ..< n {
        for j in 0 ..< n {
            if !visited[i][j], graph[i][j] >= 2 {
                cloud.append((i,j))
                graph[i][j] -= 2
            }
        }
    }
    
}

// 출력
var result = 0
for i in 0 ..< n {
    for j in 0 ..< n {
        result += graph[i][j]
    }
}
print(result)
