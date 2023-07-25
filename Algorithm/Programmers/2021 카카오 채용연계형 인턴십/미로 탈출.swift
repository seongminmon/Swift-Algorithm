//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/07.
//
// 미로 탈출
// 2021 카카오 채용연계형 인턴십
// Lv. 4
// https://school.programmers.co.kr/learn/courses/30/lessons/81304

import Foundation

struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func enqueue(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 && !comparer(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
        }
    }
    
    mutating func dequeue() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count-1)
        let result = nodes.removeLast()
        
        var idx = 0
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]) && comparer(nodes[idx], nodes[right]) {
                    nodes.swapAt(idx, right)
                    idx = right
                } else if comparer(nodes[idx], nodes[left]) {
                    nodes.swapAt(idx, left)
                    idx = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if comparer(nodes[idx], nodes[left]) {
                    nodes.swapAt(idx, left)
                    idx = left
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

func solution(_ n:Int, _ start:Int, _ end:Int, _ roads:[[Int]], _ traps:[Int]) -> Int {
    var originalGraph = [[(Int,Int)]](repeating: [], count: n+1)
    var reversedGraph = [[(Int,Int)]](repeating: [], count: n+1)
    var isTrap = [Int](repeating: -1, count: n+1)
    
    for road in roads {
        let (a,b,c) = (road[0], road[1], road[2])
        originalGraph[a].append((b,c))
        reversedGraph[b].append((a,c))
    }
    
    for i in 0..<traps.count {
        isTrap[traps[i]] = i
    }
    
    func bitmask(_ state: Int, _ idx: Int) -> Bool {
        return 1 << isTrap[idx] & state != 0
    }
    
    var distance = [[Int]](repeating: [Int](repeating: Int.max, count: 1024), count: n+1)
    distance[start][0] = 0
    var queue = Heap<(Int,Int,Int)> { $0.0 > $1.0 }
    queue.enqueue((0, start, 0))
    while !queue.isEmpty {
        let (dist, now, state) = queue.dequeue()!
        
        if now == end { return dist }
        if distance[now][state] != dist { continue }
        
        func step(_ graph: [[(Int,Int)]], _ isReverse: Bool) {
            for (next, nextDist) in graph[now] {
                var isReverse = isReverse
                if isTrap[now] != -1 && bitmask(state, now) {
                    isReverse.toggle()
                }
                if isTrap[next] != -1 && bitmask(state, next) {
                    isReverse.toggle()
                }
                if isReverse { continue }
                
                var nextState = state
                if isTrap[next] != -1 {
                    nextState ^= (1 << isTrap[next])
                }
                let cost = dist + nextDist
                if distance[next][nextState] > cost {
                    distance[next][nextState] = cost
                    queue.enqueue((cost, next, nextState))
                }
            }
        }
        
        step(originalGraph, false)
        step(reversedGraph, true)
    }
    
    return -1
}

print(solution(3, 1, 3, [[1, 2, 2], [3, 2, 3]], [2]))
print(solution(4, 1, 4, [[1, 2, 1], [3, 2, 1], [2, 4, 1]], [2, 3]))
