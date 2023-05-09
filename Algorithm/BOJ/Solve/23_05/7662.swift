//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/01.
//
// 7662 : 이중 우선순위 큐
// https://www.acmicpc.net/problem/7662

import Foundation

struct Heap<T> {
    var nodes = [T]()
    let comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var peek: T? {
        return nodes.first
    }
    
    mutating func push(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 && !comparer(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
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

let t = Int(readLine()!)!
for _ in 0..<t {
    let k = Int(readLine()!)!
    var orders = [(String, Int)]()
    for _ in 0..<k {
        let order = readLine()!.split(separator: " ").map{ String($0) }
        orders.append((order[0], Int(order[1])!))
    }

    var maxHeap = Heap<(Int,Int)> { $0.0 < $1.0 }
    var minHeap = Heap<(Int,Int)> { $0.0 > $1.0 }
    var visited = [Bool](repeating: false, count: k)

    for i in 0..<k {
        if orders[i].0 == "I" {
            maxHeap.push((orders[i].1, i))
            minHeap.push((orders[i].1, i))
            visited[i] = true
        } else if orders[i].1 == 1 {
            alreadyDelete(&maxHeap)
            if !maxHeap.isEmpty {
                visited[maxHeap.pop()!.1] = false
            }
        } else {
            alreadyDelete(&minHeap)
            if !minHeap.isEmpty {
                visited[minHeap.pop()!.1] = false
            }
        }
    }
    
    alreadyDelete(&maxHeap)
    alreadyDelete(&minHeap)
    
    func alreadyDelete(_ heap: inout Heap<(Int,Int)>) {
        while !heap.isEmpty && !visited[heap.peek!.1] {
            _ = heap.pop()
        }
    }

    if maxHeap.isEmpty || minHeap.isEmpty {
        print("EMPTY")
    } else {
        print(maxHeap.peek!.0, minHeap.peek!.0)
    }
}
