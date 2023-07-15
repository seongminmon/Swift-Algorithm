//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/12.
//
// 24444 : 알고리즘 수업 - 너비 우선 탐색 1
// https://www.acmicpc.net/problem/24444

import Foundation

// 입력 받기 (n, m, start, graph)
let input1 = readLine()!.split(separator: " ").map{ Int(String($0))! }
var n = input1[0]
var m = input1[1]
var r = input1[2]

var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 1...m {
    let input2 = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input2[0]].append(input2[1])
    graph[input2[1]].append(input2[0])
}

// 인접 노드 오름차순 정렬
for i in 1...n {
    graph[i].sort()
}

// 커서 큐 : 구조체로 구현 (dequeue : O(1))
public struct Queue<T> {
    var nodes = [T]()
    var idx = 0
    
    var isEmpty: Bool {
        return !(nodes.count > idx)
    }
    
    mutating func enqueue(_ element: T) {
        nodes.append(element)
    }
    
    mutating func dequeue() -> T {
        defer {
            idx += 1
        }
        return nodes[idx]
    }
}

// 빈 큐 생성
var myQueue = Queue<Int>()
// 방문 순서 : 0으로 초기화
var ans = [Int](repeating: 0, count: n+1)
var cnt: Int = 1

func BFS(node: Int) {
    visited[node] = true
    myQueue.enqueue(node)
    cnt = 1
    ans[node] = cnt

    while !myQueue.isEmpty {
        let temp = myQueue.dequeue()
        for i in graph[temp] {
            if !visited[i] {
                visited[i] = true
                myQueue.enqueue(i)
                cnt += 1
                ans[i] = cnt
            }
        }
    }
}

BFS(node: r)

for i in 1...n {
    print(ans[i])
}
