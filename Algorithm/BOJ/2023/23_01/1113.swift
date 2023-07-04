//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/16.
//
// 1113 : 수영장 만들기
// https://www.acmicpc.net/problem/1113

import Foundation

// 풀이 1
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ Int(String($0))! }
    graph.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func check(_ x: Int, _ y: Int) -> Bool {
    for i in 0 ..< 4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= m {
            return false
        }
    }
    return true
}

var result = 0
var height = 9
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

while height > 0 {
    var nowGraph = graph
    var nowVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    for i in 0 ..< n {
        for j in 0 ..< m {
            if nowGraph[i][j] < height {
                nowGraph[i][j] = height
            }
        }
    }
    
    for i in 0 ..< n {
        for j in 0 ..< m {
            if visited[i][j] || nowVisited[i][j] || nowGraph[i][j] > height {
                continue
            }
            
            var tempWater = nowGraph[i][j] - graph[i][j]
            var flag = true
            var cnt = 1
            
            nowVisited[i][j] = true
            var queue = [(i,j)]
            var idx = 0
            while idx < queue.count {
                let (x,y) = queue[idx]
                idx += 1
                
                for i in 0 ..< 4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if nx < 0 || nx >= n || ny < 0 || ny >= m {
                        flag = false
                        continue
                    }
                    
                    if nowVisited[nx][ny] || nowGraph[nx][ny] > height {
                        continue
                    }
                    
                    if !check(nx, ny) {
                        flag = false
                    }
                    
                    nowVisited[nx][ny] = true
                    queue.append((nx,ny))
                    
                    tempWater += nowGraph[nx][ny] - graph[nx][ny]
                    cnt += 1
                }
            }
            
            if flag {
                for (x,y) in queue {
                    visited[x][y] = true
                }
                result += tempWater + cnt
            }
        }
    }
    height -= 1
}

print(result)


// 풀이 2
//let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
//let (n,m) = (nm[0], nm[1])
//var graph = [[Int]]()
//for _ in 0 ..< n {
//    let input = readLine()!.map{ Int(String($0))! }
//    graph.append(input)
//}
//
//var maxHeight = 0
//var minHeight = Int(1e9)
//for i in 0 ..< n {
//    for j in 0 ..< m {
//        maxHeight = max(maxHeight, graph[i][j])
//        minHeight = min(minHeight, graph[i][j])
//    }
//}
//
//var waters = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
//for i in 0 ..< n {
//    for j in 0 ..< m {
//        waters[i][j] = maxHeight - graph[i][j]
//    }
//}
//
//let dx = [0,0,1,-1]
//let dy = [1,-1,0,0]
//
//var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
//func bfs(_ sx: Int, _ sy: Int) {
//    visited[sx][sy] = true
//    var queue = [(sx,sy)]
//    var idx = 0
//
//    while idx < queue.count {
//        let (x,y) = queue[idx]
//        idx += 1
//
//        waters[x][y] -= 1
//
//        for i in 0 ..< 4 {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//
//            if nx < 0 || nx >= n || ny < 0 || ny >= m || visited[nx][ny] {
//                continue
//            }
//
//            if graph[nx][ny] + waters[nx][ny] == height && waters[nx][ny] > 0 {
//                visited[nx][ny] = true
//                queue.append((nx,ny))
//            }
//        }
//    }
//}
//
//var height = maxHeight
//while height > minHeight {
//    visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
//
//    for i in 0 ..< n {
//        for j in 0 ..< m {
//            if waters[i][j] > 0, !visited[i][j] {
//                for d in 0 ..< 4 {
//                    let nx = i + dx[d]
//                    let ny = j + dy[d]
//
//                    if nx < 0 || nx >= n || ny < 0 || ny >= m ||
//                        graph[nx][ny] + waters[nx][ny] < graph[i][j] + waters[i][j] {
//                        bfs(i, j)
//                        break
//                    }
//                }
//            }
//        }
//    }
//
//    height -= 1
//}
//
//var result = 0
//for i in 0 ..< n {
//    result += waters[i].reduce(0,+)
//}
//print(result)
