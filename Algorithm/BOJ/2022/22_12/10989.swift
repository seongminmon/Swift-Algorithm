//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 10989 : 수 정렬하기 3
// https://www.acmicpc.net/problem/10989

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

// 1. fileIO 버전 (1476ms)
let file = FileIO()

let n = file.readInt()
var cntArr = [Int](repeating: 0, count: 10001)
for _ in 0 ..< n {
    let num = file.readInt()
    cntArr[num] += 1
}

// 2. fileIO 안 쓴 버전 (4708ms)
//let n = Int(readLine()!)!
//var cntArr = [Int](repeating: 0, count: 10001)
//for _ in 0 ..< n {
//    let num = Int(readLine()!)!
//    cntArr[num] += 1
//}

// 출력
var result = ""
for i in 1 ... 10000 {
    result += String(repeating: "\(i)\n", count: cntArr[i])
}
print(result)
