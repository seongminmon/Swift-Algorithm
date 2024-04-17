//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/14/24.
//
// 2170 : 선 긋기
// https://www.acmicpc.net/problem/2170

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

let n = fileIO.readInt()
var loc = [(Int, Int)]()
for _ in 0..<n {
    let s = fileIO.readInt()
    let e = fileIO.readInt()
    loc.append((s, e))
}

// start 기준 오름차순 정렬
loc.sort { $0.0 < $1.0 }

var ans = 0
var start = loc[0].0
var end = loc[0].1

for (s, e) in loc {
    if s > end {
        ans += end - start
        start = s
    }
    end = max(end, e)
}
ans += end - start

print(ans)
