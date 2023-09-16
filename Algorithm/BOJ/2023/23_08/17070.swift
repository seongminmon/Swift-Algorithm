//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/16.
//
// 17070 : 파이프 옮기기 1
// https://www.acmicpc.net/problem/17070

import Foundation

// 풀이 1
struct Pipe {
    var x1: Int
    var y1: Int
    var x2: Int
    var y2: Int
    var type: Shape

    enum Shape {
        case horizontal
        case vertical
        case diagonal
    }
}

let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

func isPossible(_ pipe: Pipe) -> Bool {
    // 범위 내에 있고
    if 0 <= pipe.x1 && pipe.x1 < n &&
        0 <= pipe.y1 && pipe.y1 < n &&
        0 <= pipe.x2 && pipe.x2 < n &&
        0 <= pipe.y2 && pipe.y2 < n {
        // 벽이 아닐때
        if pipe.type == .diagonal {
            // 대각선일 때
            if graph[pipe.x1][pipe.y1] == 0 &&
                graph[pipe.x2][pipe.y2] == 0 &&
                graph[pipe.x1][pipe.y1+1] == 0 &&
                graph[pipe.x1+1][pipe.y1] == 0 {
                return true
            }
        } else {
            // 가로와 세로일 때
            if graph[pipe.x1][pipe.y1] == 0 &&
                graph[pipe.x2][pipe.y2] == 0 {
                return true
            }
        }
    }
    return false
}

var ans = 0
func dfs(_ pipe: Pipe) {
    // 조기 탈출
    if !isPossible(pipe) {
        return
    }

    // 종료 조건
    if (pipe.x2, pipe.y2) == (n-1, n-1) {
        ans += 1
        return
    }

    switch pipe.type {
    case .horizontal:
        dfs(Pipe(
            x1: pipe.x1, y1: pipe.y1+1,
            x2: pipe.x2, y2: pipe.y2+1,
            type: .horizontal)
        )
        dfs(Pipe(
            x1: pipe.x1, y1: pipe.y1+1,
            x2: pipe.x2+1, y2: pipe.y2+1,
            type: .diagonal)
        )
    case .vertical:
        dfs(Pipe(
            x1: pipe.x1+1, y1: pipe.y1,
            x2: pipe.x2+1, y2: pipe.y2,
            type: .vertical)
        )
        dfs(Pipe(
            x1: pipe.x1+1, y1: pipe.y1,
            x2: pipe.x2+1, y2: pipe.y2+1,
            type: .diagonal)
        )
    case .diagonal:
        dfs(Pipe(
            x1: pipe.x1+1, y1: pipe.y1+1,
            x2: pipe.x2, y2: pipe.y2+1,
            type: .horizontal)
        )
        dfs(Pipe(
            x1: pipe.x1+1, y1: pipe.y1+1,
            x2: pipe.x2+1, y2: pipe.y2,
            type: .vertical)
        )
        dfs(Pipe(
            x1: pipe.x1+1, y1: pipe.y1+1,
            x2: pipe.x2+1, y2: pipe.y2+1,
            type: .diagonal)
        )
    }
}

dfs(Pipe(x1: 0, y1: 0, x2: 0, y2: 1, type: .horizontal))

print(ans)

// 풀이 2
//let n = Int(readLine()!)!
//var graph = [[Int]]()
//for _ in 0..<n {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    graph.append(input)
//}
//
//typealias Tuple = (horizontal: Int, vertical: Int, diagonal: Int)
//var dp = [[Tuple]](repeating: [Tuple](repeating: (0, 0, 0), count: n), count: n)
//dp[0][1].horizontal = 1
//
//for x in 0..<n {
//    for y in 0..<n {
//        if graph[x][y] == 1 || (x == 0 && y == 1) {
//            continue
//        }
//
//        if y > 0 {
//            dp[x][y].horizontal = dp[x][y-1].horizontal + dp[x][y-1].diagonal
//        }
//
//        if x > 0 {
//            dp[x][y].vertical = dp[x-1][y].vertical + dp[x-1][y].diagonal
//        }
//
//        if x > 0 && y > 0 && graph[x-1][y] == 0 && graph[x][y-1] == 0 {
//            dp[x][y].diagonal = dp[x-1][y-1].horizontal + dp[x-1][y-1].vertical + dp[x-1][y-1].diagonal
//        }
//    }
//}
//
//print(dp[n-1][n-1].horizontal + dp[n-1][n-1].vertical + dp[n-1][n-1].diagonal)
