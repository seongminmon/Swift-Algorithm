//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/20.
//
// 14466 : 소가 길을 건너간 이유 6
// https://www.acmicpc.net/problem/14466

import Foundation

// 내 풀이 (512ms)
let nkr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k,r) = (nkr[0], nkr[1], nkr[2])

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var graph = [[[(Int,Int)]]](repeating: [[(Int,Int)]](repeating: [], count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        for d in 0..<4 {
            let ni = i + dx[d]
            let nj = j + dy[d]

            if 0 <= ni, ni < n, 0 <= nj, nj < n {
                graph[i][j].append((ni,nj))
            }
        }
    }
}

for _ in 0..<r {
    let input = readLine()!.split(separator: " ").map { Int(String($0))!-1 }
    let (r1,c1,r2,c2) = (input[0], input[1], input[2], input[3])

    for i in 0..<graph[r1][c1].count {
        if graph[r1][c1][i] == (r2,c2) {
            graph[r1][c1].remove(at: i)
            break
        }
    }
    for i in 0..<graph[r2][c2].count {
        if graph[r2][c2][i] == (r1,c1) {
            graph[r2][c2].remove(at: i)
            break
        }
    }
}

var cows = [(Int,Int)]()
for _ in 0..<k {
    let cow = readLine()!.split(separator: " ").map { Int(String($0))! }
    cows.append((cow[0]-1, cow[1]-1))
}

func bfs(_ start: (Int,Int), _ end: (Int,Int)) -> Bool {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    visited[start.0][start.1] = true
    var queue = [start]
    var idx = 0

    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1

        for (nx,ny) in graph[x][y] {
            if !visited[nx][ny] {
                if (nx,ny) == end {
                    return true
                }
                visited[nx][ny] = true
                queue.append((nx,ny))
            }
        }
    }

    return false
}

var ans = 0
for i in 0..<k-1 {
    for j in i+1..<k {
        if !bfs(cows[i], cows[j]) {
            ans += 1
        }
    }
}
print(ans)

// 다른 풀이 (56ms)
//let nkr = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (n,k,r) = (nkr[0], nkr[1], nkr[2])
//
//var disconnect = [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: n), count: n), count: n), count: n)
//for _ in 0..<r {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))!-1 }
//    let (r1,c1,r2,c2) = (input[0], input[1], input[2], input[3])
//    disconnect[r1][c1][r2][c2] = true
//    disconnect[r2][c2][r1][c1] = true
//}
//
//var group = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
//var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
//func bfs(_ sx: Int, _ sy: Int, _ num: Int) {
//    let dx = [0,0,1,-1]
//    let dy = [1,-1,0,0]
//
//    var queue = [(sx,sy)]
//    var idx = 0
//
//    while idx < queue.count {
//        let (x,y) = queue[idx]
//        idx += 1
//
//        for i in 0..<4 {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//
//            if 0 <= nx, nx < n, 0 <= ny, ny < n, !visited[nx][ny], !disconnect[x][y][nx][ny] {
//                visited[nx][ny] = true
//                queue.append((nx,ny))
//                group[nx][ny] = cnt
//            }
//        }
//    }
//}
//
//var cnt = 0
//for i in 0..<n {
//    for j in 0..<n {
//        if !visited[i][j] {
//            visited[i][j] = true
//            group[i][j] = cnt
//            bfs(i, j, cnt)
//            cnt += 1
//        }
//    }
//}
//
//var cowGroup = [Int]()
//for _ in 0..<k {
//    let cow = readLine()!.split(separator: " ").map { Int(String($0))! }
//    let (x,y) = (cow[0]-1, cow[1]-1)
//    cowGroup.append(group[x][y])
//}
//
//var ans = 0
//for i in 0..<k-1 {
//    for j in i+1..<k {
//        if cowGroup[i] != cowGroup[j] {
//            ans += 1
//        }
//    }
//}
//print(ans)
