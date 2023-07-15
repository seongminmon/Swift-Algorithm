//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/15.
//
// 24445 : 알고리즘 수업 - 너비 우선 탐색 2
// https://www.acmicpc.net/problem/24445

import Foundation

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

for i in 1...n {
    graph[i].sort(by: >)
}

struct Queue<T> {
    var nodes: [T] = []
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

var myQueue = Queue<Int>()
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
