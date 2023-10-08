//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/04.
//
// 11000 : 강의실 배정
// https://www.acmicpc.net/problem/11000

import Foundation

struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool

    var count: Int {
        return nodes.count
    }

    var peek: T? {
        return nodes.first
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

let n = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}
// 시작 시간 기준으로 정렬
arr.sort { $0[0] < $1[0] }

// 종료 시간 기준으로 minHeap 생성
var queue = Heap<Int> { $0 > $1 }
queue.insert(arr[0][1])

for i in 1..<n {
    let s = arr[i][0]
    let t = arr[i][1]

    // 1. 강의실 추가
    if queue.peek! > s {
        queue.insert(t)
    } else {
    // 2. 기존 강의실 배정
        _ = queue.delete()
        queue.insert(t)
    }
}
print(queue.count)
