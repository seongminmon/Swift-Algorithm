//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/07.
//
// 1202 : 보석 도둑
// https://www.acmicpc.net/problem/1202

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

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var arr = [(Int,Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((input[0], input[1]))
}

var bags = [Int]()
for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

// 무게 기준 오름차순 정렬
arr.sort { $0.0 < $1.0 }
bags.sort()

// 가격 기준 maxHeap 생성
var pq = Heap<(Int,Int)> { $0.1 < $1.1 }
var ans = 0
var idx = 0

for bag in bags {
    // 담을 수 있는 보석들 큐에 추가
    while idx < arr.count && arr[idx].0 <= bag {
        pq.push(arr[idx])
        idx += 1
    }
    
    // 큐에 있는 것 중 가장 가격이 큰 것 담기
    if !pq.isEmpty {
        ans += pq.pop()!.1
    }
}

print(ans)
