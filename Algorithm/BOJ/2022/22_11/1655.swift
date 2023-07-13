//
//  1655.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/27.
//
// 1655 : 가운데를 말해요
// https://www.acmicpc.net/problem/1655

import Foundation

// 라이노님의 FileIO
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}

struct Heap<T: Comparable> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count: Int {
        return nodes.count
    }
    
    var root: T? {
        return nodes.first
    }
    
    mutating func push(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0, !comparer(nodes[idx], nodes[(idx - 1) / 2]) {
            nodes.swapAt(idx, (idx - 1) / 2)
            idx = (idx - 1) / 2
        }
    }
    
    mutating func pop() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count - 1)
        let result = nodes.removeLast()
        var idx = 0
        
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), comparer(nodes[idx], nodes[right]) {
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

let file = FileIO()
let n = file.readInt()

var maxHeap = Heap<Int>{ $0 < $1 }
var minHeap = Heap<Int>{ $0 > $1 }

var result = ""
for _ in 0 ..< n {
    let num = file.readInt()
    
    if maxHeap.isEmpty {
        maxHeap.push(num)
    } else {
        if num > maxHeap.root! {
            minHeap.push(num)
        } else {
            maxHeap.push(num)
        }
        
        // 균형 맞추기
        let diff = maxHeap.count - minHeap.count
        if diff == 2 {
            minHeap.push(maxHeap.pop()!)
        } else if diff == -1 {
            maxHeap.push(minHeap.pop()!)
        }
    }
    
    result += "\(maxHeap.root!)\n"
}

print(result)
