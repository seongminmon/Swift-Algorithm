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
    
    init(comparer: @escaping (T, T) -> Bool) {
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
    var originGraph = [[(Int,Int)]](repeating: [], count: n+1)
    var reversedGraph = [[(Int,Int)]](repeating: [], count: n+1)
    for road in roads {
        let (a,b,c) = (road[0], road[1], road[2])
        originGraph[a].append((b,c))
        reversedGraph[b].append((a,c))
    }
    
    var isTrap = [Int](repeating: -1, count: n+1)
    for i in 0..<traps.count { isTrap[traps[i]] = i }
    
    func bitmask(_ idx: Int, _ state: Int) -> Bool {
        return 1 << isTrap[idx] & state != 0
    }
    
    var distance = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: 1024)
    distance[0][start] = 0
    var queue = Heap<(Int,Int,Int)> { $0.0 > $1.0 }
    queue.enqueue((distance[0][start], start, 0))
    while !queue.isEmpty {
        let (dist, now, state) = queue.dequeue()!
        
        if now == end { return dist }
        if distance[state][now] != dist { continue }
        
        for (next, nextDist) in originGraph[now] {
            var isReverse = 0
            if isTrap[now] != -1 && bitmask(now, state) {
                isReverse ^= 1
            }
            if isTrap[next] != -1 && bitmask(next, state) {
                isReverse ^= 1
            }
            if isReverse != 0 { continue }
            
            var nextState = state
            if isTrap[next] != -1 {
                nextState ^= (1 << isTrap[next])
            }
            if distance[nextState][next] > dist + nextDist {
                distance[nextState][next] = dist + nextDist
                queue.enqueue((distance[nextState][next], next, nextState))
            }
        }
        
        for (next, nextDist) in reversedGraph[now] {
            var isReverse = 0
            if isTrap[now] != -1 && bitmask(now, state) {
                isReverse ^= 1
            }
            if isTrap[next] != -1 && bitmask(next, state) {
                isReverse ^= 1
            }
            if isReverse == 0 { continue }
            
            var nextState = state
            if isTrap[next] != -1 {
                nextState ^= (1 << isTrap[next])
            }
            if distance[nextState][next] > dist + nextDist {
                distance[nextState][next] = dist + nextDist
                queue.enqueue((distance[nextState][next], next, nextState))
            }
        }
    }
    
    return -1
}

print(solution(3, 1, 3, [[1, 2, 2], [3, 2, 3]], [2]))
print(solution(4, 1, 4, [[1, 2, 1], [3, 2, 1], [2, 4, 1]], [2, 3]))
