//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/19.
//
// 등산코스 정하기
// 2022 KAKAO TECH INTERNSHIP
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/118669

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

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var graph = [[(Int, Int)]](repeating: [], count: n+1)
    for path in paths {
        let (a,b,c) = (path[0], path[1], path[2])
        graph[a].append((b,c))
        graph[b].append((a,c))
    }
    
    var isSummit = [Bool](repeating: false, count: n+1)
    for summit in summits {
        isSummit[summit] = true
    }
    
    func dijkstra() -> [Int] {
        var intensity = [Int](repeating: Int.max, count: n+1)
        var queue = Heap<(Int, Int)> { $0.1 > $1.1 }
        
        // 모든 출입구 넣기
        for gate in gates {
            intensity[gate] = 0
            queue.insert((gate, 0))
        }
        
        while !queue.isEmpty {
            let (now, nowCost) = queue.delete()!
            
            // 산봉우리이면 패스
            if isSummit[now] { continue }
            
            // 기존 intensity보다 크면 패스
            if intensity[now] < nowCost { continue }
            
            for (next, nextCost) in graph[now] {
                // 최솟값 갱신
                let cost = max(nowCost, nextCost)
                if intensity[next] > cost {
                    intensity[next] = cost
                    queue.insert((next, cost))
                }
            }
        }
        
        // 1. 가장 작은 intensity를 가진 코스
        // 2. intensity가 같다면 산봉우리 번호가 작은 코스
        var ans = [-1, Int.max]
        for summit in summits {
            if ans[1] > intensity[summit] {
                ans = [summit, intensity[summit]]
            } else if ans[1] == intensity[summit] {
                ans[0] = min(ans[0], summit)
            }
        }
        return ans
    }
    
    return dijkstra()
}

print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
print(solution(7, [[1, 4, 4], [1, 6, 1], [1, 7, 3], [2, 5, 2], [3, 7, 4], [5, 6, 6]], [1], [2, 3, 4]))
print(solution(7, [[1, 2, 5], [1, 4, 1], [2, 3, 1], [2, 6, 7], [4, 5, 1], [5, 6, 1], [6, 7, 1]], [3, 7], [1, 5]))
print(solution(5, [[1, 3, 10], [1, 4, 20], [2, 3, 4], [2, 4, 6], [3, 5, 20], [4, 5, 6]], [1, 2], [5]))
