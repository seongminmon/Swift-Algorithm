//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/27.
//
// 4485 : 녹색 옷 입은 애가 젤다지?
// https://www.acmicpc.net/problem/4485

import Foundation

struct Queue<T> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func push(_ element: T) {
        var idx = nodes.count
        nodes.append(element)
        
        while idx > 0, !comparer(nodes[idx], nodes[(idx-1) / 2]) {
            nodes.swapAt(idx, (idx-1) / 2)
            idx = (idx-1) / 2
        }
    }
    
    mutating func pop() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count-1)
        let result = nodes.removeLast()
        var idx = 0
        
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[idx], nodes[left]), comparer(nodes[left], nodes[right]) {
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

var prob = 1
while let t = readLine() {
    // 입력
    let n = Int(t)!
    
    if n == 0 { break }
    
    var graph = [[Int]]()
    for _ in 0 ..< n {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph.append(input)
    }
    
    // 풀이
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    let MAX = Int(1e9)
    var dist = [[Int]](repeating: [Int](repeating: MAX, count: n), count: n)
    var queue = Queue<(Int,Int,Int)>{ $0.0 > $1.0 }
    
    dist[0][0] = graph[0][0]
    queue.push((dist[0][0], 0, 0))
    
    while !queue.isEmpty {
        let (d, x, y) = queue.pop()!
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               dist[nx][ny] > d + graph[nx][ny] {
                dist[nx][ny] = d + graph[nx][ny]
                queue.push((dist[nx][ny], nx, ny))
            }
        }
    }
    
    // 출력
    print("Problem \(prob): \(dist[n-1][n-1])")
    prob += 1
}
