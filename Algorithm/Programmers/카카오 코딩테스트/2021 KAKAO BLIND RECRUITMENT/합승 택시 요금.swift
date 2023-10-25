//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/07.
//
// 합승 택시 요금
// 2021 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/72413

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
        while idx > 0 && !comparer(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
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
                if comparer(nodes[idx], nodes[right]) && comparer(nodes[left], nodes[right]) {
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

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let INF = Int(1e9)
    var graph = [[(Int,Int)]](repeating: [], count: n+1)
    for fare in fares {
        let (a,b,c) = (fare[0], fare[1], fare[2])
        graph[a].append((b,c))
        graph[b].append((a,c))
    }
    
    func dijkstra(_ start: Int) -> [Int] {
        var distance = [Int](repeating: INF, count: n+1)
        distance[start] = 0
        var queue = Heap<(Int,Int)> { $0.1 > $1.1 }
        queue.insert((start, 0))
        
        while !queue.isEmpty {
            let (now, nowDist) = queue.delete()!
            
            if distance[now] < nowDist {
                continue
            }
            
            for (next, nextDist) in graph[now] {
                let dist = nowDist + nextDist
                if distance[next] > dist {
                    distance[next] = dist
                    queue.insert((next, dist))
                }
            }
        }
        return distance
    }
    
    let sDist = dijkstra(s)
    let aDist = dijkstra(a)
    let bDist = dijkstra(b)
    var ans = INF
    for i in 1...n {
        ans = min(ans, sDist[i] + aDist[i] + bDist[i])
    }
    return ans
}

print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))
print(solution(7, 3, 4, 1, [[5, 7, 9], [4, 6, 4], [3, 6, 1], [3, 2, 3], [2, 1, 6]]))
print(solution(6, 4, 5, 6, [[2,6,6], [6,3,7], [4,6,7], [6,5,11], [2,5,12], [5,3,20], [2,4,8], [4,3,9]]))
