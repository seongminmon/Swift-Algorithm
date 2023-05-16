//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/03.
//
// 1005 : ACM Craft
// https://www.acmicpc.net/problem/1005

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

let fileIO = FileIO()

let t = fileIO.readInt()
for _ in 0 ..< t {
    let n = fileIO.readInt()
    let k = fileIO.readInt()
    var times: [Int] = [0]
    for _ in 0 ..< n {
        times.append(fileIO.readInt())
    }
    
    var graph = [[Int]](repeating: [], count: n+1)
    var inDegree = [Int](repeating: 0, count: n+1)
    for _ in 0 ..< k {
        let x = fileIO.readInt()
        let y = fileIO.readInt()
        graph[x].append(y)
        inDegree[y] += 1
    }
    let w = fileIO.readInt()
    
    var queue = [Int]()
    var idx = 0
    for i in 1 ... n {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }
    
    var maxTimes = [Int](repeating: 0, count: n+1)
    outerLoop: while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        for next in graph[now] {
            if maxTimes[next] < maxTimes[now] + times[now] {
                maxTimes[next] = maxTimes[now] + times[now]
            }
            
            inDegree[next] -= 1
            if inDegree[next] == 0 {
                // 조기 탈출
                if next == w { break outerLoop }
                queue.append(next)
            }
        }
    }
    
    print(maxTimes[w] + times[w])
}
