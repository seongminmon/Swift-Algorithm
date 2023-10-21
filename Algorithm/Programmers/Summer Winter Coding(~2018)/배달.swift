//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/21.
//
// 배달
// Summer/Winter Coding(~2018)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/12978

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
    
    mutating func insert(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 && !comparer(nodes[idx], nodes[(idx-1) / 2]) {
            nodes.swapAt(idx, (idx-1) / 2)
            idx = (idx-1) / 2
        }
    }
    
    mutating func delete() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count-1)
        let result = nodes.removeLast()
        
        var idx = 0
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[idx], nodes[right]), comparer(nodes[left], nodes[right]) {
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

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var graph = [[(Int,Int)]](repeating: [], count: N+1)
    for i in 0..<road.count {
        let (a,b,c) = (road[i][0], road[i][1], road[i][2])
        graph[a].append((b,c))
        graph[b].append((a,c))
    }
    
    var distance = [Int](repeating: Int.max, count: N+1)
    distance[1] = 0
    var queue = Heap<(Int,Int)> { $0.1 > $1.1 }
    queue.insert((1,0))
    while !queue.isEmpty {
        let (now, dist) = queue.delete()!
        
        if distance[now] < dist { continue }
        
        for (next, nextDist) in graph[now] {
            let cost = dist + nextDist
            if distance[next] > cost {
                distance[next] = cost
                queue.insert((next, cost))
            }
        }
    }
    
    return distance.filter { $0 <= k }.count
}

print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))
print(solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4))
