//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/9/24.
//
// 2109 : 순회강연
// https://www.acmicpc.net/problem/2109

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
    
    var count: Int {
        return nodes.count
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
        let ret = nodes.removeLast()
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
        
        return ret
    }
}

let n = Int(readLine()!)!
var arr = [(Int,Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

// 날짜 기준 오름차순 정렬
arr.sort { $0.1 < $1.1 }

// 비용 기준 minHeap 생성
var heap = Heap<Int> { $0 > $1 }
for i in 0..<n {
    heap.push(arr[i].0)
    if heap.count > arr[i].1 {
        _ = heap.pop()
    }
}

// heap에 남은 것이 정답
var ans = 0
while !heap.isEmpty {
    ans += heap.pop()!
}
print(ans)
