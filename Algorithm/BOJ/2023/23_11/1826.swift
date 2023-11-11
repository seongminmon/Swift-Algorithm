//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/10.
//
// 1826 : 연료 채우기
// https://www.acmicpc.net/problem/1826

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

let n = Int(readLine()!)!
var arr = [(Int,Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let end = input[0]
var remain = input[1]

// 위치 기준 오름차순 정렬
arr.sort { $0.0 < $1.0 }

// maxHeap 생성
var pq = Heap<Int> { $0 < $1 }
var idx = 0
var ans = 0

while remain < end {
    // 현재 연료로 이동 가능한 주유소 큐에 추가
    while idx < n && arr[idx].0 <= remain {
        pq.push(arr[idx].1)
        idx += 1
    }
    
    // 주유
    if !pq.isEmpty {
        remain += pq.pop()!
        ans += 1
    } else {
        break
    }
}

print(remain < end ? -1 : ans)
