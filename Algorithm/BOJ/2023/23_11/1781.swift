//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/06.
//
// 1781 : 컵라면
// https://www.acmicpc.net/problem/1781

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
var arr = [[Int]]()
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(input)
}

// 데드라인 기준 오름차순 정렬
arr.sort { $0[0] < $1[0] }

// minHeap 생성
var pq = Heap<Int> { $0 > $1 }
for i in 0..<n {
    pq.push(arr[i][1])
    if pq.count > arr[i][0] {
        _ = pq.pop()
    }
}

var ans = 0
while !pq.isEmpty {
    ans += pq.pop()!
}
print(ans)
