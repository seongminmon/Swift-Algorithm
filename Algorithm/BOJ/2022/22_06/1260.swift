//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/23.
//
// 1260 : DFS와 BFS
// https://www.acmicpc.net/problem/1260

import Foundation

let input1 = readLine()!.split(separator: " ").map { Int($0)! }
let n = input1[0]
let m = input1[1]
let v = input1[2]

var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)
for _ in 0 ..< m {
    let temp = readLine()!.split(separator: " ").map { Int($0)! }
    graph[temp[0]].append(temp[1])
    graph[temp[1]].append(temp[0])
}

// 연결성분 오름차순 정렬
for i in 1...n {
    graph[i].sort()
}

// bfs에 쓰기 위해 값 복사
var graph2 = [[Int]](repeating: [], count: n+1)
for i in 0...n {
    graph2[i] = graph[i]
}

// dfs
var dfsArr = [Int]()
func dfs(graph: inout [[Int]], visited: inout [Bool], node: Int) {
    visited[node] = true
    dfsArr.append(node)
    for i in graph[node] {
        if !visited[i] {
            dfs(graph: &graph, visited: &visited, node: i)
        }
    }
}

// bfs
var myQueue = [Int]()
var bfsArr = [Int]()
func bfs(graph2: inout [[Int]], visited: inout [Bool], node: Int) {
    myQueue.append(node)
    visited[node] = true
    bfsArr.append(node)
    
    while !myQueue.isEmpty {
        let tempNode = myQueue.removeFirst()
        for i in graph2[tempNode] {
            if !visited[i] {
                myQueue.append(i)
                visited[i] = true
                bfsArr.append(i)
            }
        }
    }
    
}

// dfs 탐색
dfs(graph: &graph, visited: &visited, node: v)

// graph2와 visited 초기화
visited = [Bool](repeating: false, count: n+1)
// bfs 탐색
bfs(graph2: &graph2, visited: &visited, node: v)

for i in dfsArr {
    print(i, terminator: " ")
}
print("")
for i in bfsArr {
    print(i, terminator: " ")
}
print("")
