//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/09.
//
// 15683 : 감시
// https://www.acmicpc.net/problem/15683

import Foundation

// 풀이 1
// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[i] = input
}

// 풀이
var cctvs = [(Int, Int)]()
for i in 0 ..< n {
    for j in 0 ..< m {
        if 1 <= graph[i][j], graph[i][j] <= 5 {
            cctvs.append((i, j))
        }
    }
}
var directions = [Int](repeating: 0, count: cctvs.count)

// 우, 상, 좌, 하
let dx = [0, -1, 0, 1]
let dy = [1, 0, -1, 0]

var result = Int(1e9)
func dfs(_ depth: Int) {
    // 종료 조건
    if depth == cctvs.count {
        var tempGraph = graph

        for i in 0 ..< cctvs.count {
            let (x,y) = cctvs[i]
            let d = directions[i]

            // cctv 종류
            switch tempGraph[x][y] {
            case 1:
                tempGraph = watch(tempGraph, x, y, d)
            case 2:
                tempGraph = watch(tempGraph, x, y, d)
                tempGraph = watch(tempGraph, x, y, (d + 2) % 4)
            case 3:
                tempGraph = watch(tempGraph, x, y, d)
                tempGraph = watch(tempGraph, x, y, (d + 1) % 4)
            case 4:
                tempGraph = watch(tempGraph, x, y, d)
                tempGraph = watch(tempGraph, x, y, (d + 1) % 4)
                tempGraph = watch(tempGraph, x, y, (d + 3) % 4)
            default:
                for j in 0 ..< 4 {
                    tempGraph = watch(tempGraph, x, y, j)
                }
            }
        }

        let count = countBlind(tempGraph)
        result = min(result, count)
        return
    }

    // cctv 방향 정하기
    for i in 0 ..< 4 {
        directions[depth] = i
        dfs(depth + 1)
    }
}

func watch(_ graph: [[Int]], _ x: Int, _ y: Int, _ d: Int) -> [[Int]] {
    var tempGraph = graph

    var nx = x + dx[d]
    var ny = y + dy[d]
    while 0 <= nx, nx < n, 0 <= ny, ny < m, tempGraph[nx][ny] != 6 {
        if tempGraph[nx][ny] == 0 {
            tempGraph[nx][ny] = -1
        }

        nx += dx[d]
        ny += dy[d]
    }

    return tempGraph
}

func countBlind(_ graph: [[Int]]) -> Int {
    var cnt = 0
    for i in 0 ..< n {
        for j in 0 ..< m {
            if graph[i][j] == 0 {
                cnt += 1
            }
        }
    }
    return cnt
}

dfs(0)

// 출력
print(result)

// 풀이 2
//// 입력
//let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let (n,m) = (nm[0], nm[1])
//var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
//for i in 0 ..< n {
//    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//    graph[i] = input
//}
//
//// 풀이
//var cctvList = [(Int,Int,Int)]()    // (cctv종류, x, y)
//var originBlindCnt: Int = 0
//for i in 0 ..< n {
//    for j in 0 ..< m {
//        if 1 <= graph[i][j], graph[i][j] <= 5 {
//            cctvList.append((graph[i][j], i, j))
//        } else if graph[i][j] == 0 {
//            originBlindCnt += 1
//        }
//    }
//}
//
//let dx = [-1, 0, 1, 0]
//let dy = [0, 1, 0, -1]
//
//func watch(_ tempGraph: inout [[Int]], _ xy: (Int, Int), _ dir: Int) -> Int {
//    var coverCnt = 0
//
//    var nx = xy.0 + dx[dir]
//    var ny = xy.1 + dy[dir]
//    while 0 <= nx, nx < n, 0 <= ny, ny < m, tempGraph[nx][ny] != 6 {
//        if tempGraph[nx][ny] == 0 {
//            tempGraph[nx][ny] = -1
//            coverCnt += 1
//        }
//        nx += dx[dir]
//        ny += dy[dir]
//    }
//
//    return coverCnt
//}
//
//func cctvWatch(_ tempGraph: inout [[Int]], _ cctvNum: Int, _ xy: (Int, Int), _ dir: Int) -> Int {
//    var coverCnt = 0
//
//    switch cctvNum {
//    case 1:
//        coverCnt += watch(&tempGraph, xy, dir)
//    case 2:
//        coverCnt += watch(&tempGraph, xy, dir % 4)
//        coverCnt += watch(&tempGraph, xy, (dir + 2) % 4)
//    case 3:
//        for i in 0 ..< 2 {
//            coverCnt += watch(&tempGraph, xy, (dir + i) % 4)
//        }
//    case 4:
//        for i in 0 ..< 3 {
//            coverCnt += watch(&tempGraph, xy, (dir + i) % 4)
//        }
//    default:
//        for i in 0 ..< 4 {
//            coverCnt += watch(&tempGraph, xy, (dir + i) % 4)
//        }
//    }
//
//    return coverCnt
//}
//
//var result = Int(1e9)
//func dfs(_ depth: Int, _ tempGraph: [[Int]], _ coverCnt: Int) {
//    // 종료 조건
//    if depth == cctvList.count {
//        let blindCnt = originBlindCnt - coverCnt
//        result = min(result, blindCnt)
//        return
//    }
//
//    // 재귀
//    var nowGraph = tempGraph
//    let now = cctvList[depth]
//    for d in 0 ..< 4 {
//        let cctvNum = now.0
//        let xy = (now.1, now.2)
//
//        let nowCoverCnt = cctvWatch(&nowGraph, cctvNum, xy, d)
//        dfs(depth + 1, nowGraph, coverCnt + nowCoverCnt)
//
//        nowGraph = tempGraph
//    }
//}
//
//dfs(0, graph, 0)
//
//// 출력
//print(result)
