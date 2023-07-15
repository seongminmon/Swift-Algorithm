//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/22.
//
// 1504 : 특정한 최단 경로
// https://www.acmicpc.net/problem/1504

import Foundation

struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        
        while index > 0, !comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }
    
    mutating func delete() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()
        
        var index = 0
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        return result
    }
}

struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        lhs.cost < rhs.cost
    }
    var cost: Int
    var node: Int
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (input[0],input[1])

var graph = [[(Int,Int)]](repeating:[], count: n+1)
for _ in 0 ..< m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,c) = (abc[0],abc[1],abc[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
let (x,y) = (xy[0],xy[1])

let INF = Int(1e9)
func dijkstra(_ start: Int) -> [Int] {
    var dist = [Int](repeating: INF, count: n+1)
    dist[start] = 0
    
    var minHeap = Heap<Data>(){ $0.cost > $1.cost }
    minHeap.insert(Data(cost: 0, node: start))
    
    while !minHeap.isEmpty {
        let now = minHeap.delete()!
        
        if dist[now.node] < now.cost {
            continue
        }
        
        for nextNode in graph[now.node] {
            let cost = now.cost + nextNode.1
            if cost < dist[nextNode.0] {
                dist[nextNode.0] = cost
                minHeap.insert(Data(cost: cost, node: nextNode.0))
            }
        }
    }
    return dist
}

let dist1 = dijkstra(1)
let distX = dijkstra(x)
let distY = dijkstra(y)

let ans1 = dist1[x] + distX[y] + distY[n]
let ans2 = dist1[y] + distY[x] + distX[n]

let ans = min(ans1, ans2)
if ans >= INF {
    print(-1)
} else {
    print(ans)
}
