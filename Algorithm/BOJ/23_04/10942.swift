//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/10.
//
// 10942 : 팰린드롬?
// https://www.acmicpc.net/problem/10942

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

let file = FileIO()

let n = file.readInt()
var arr = [-1]
for _ in 0 ..< n {
    arr.append(file.readInt())
}

var dp = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)

// 한글자는 항상 팰린드롬
dp[n][n] = true
for i in 1 ..< n {
    dp[i][i] = true
    
    // 두글자까지 미리 체크
    if arr[i] == arr[i+1] {
        dp[i][i+1] = true
    }
}

for i in stride(from: n-2, to: 0, by: -1) {
    for j in i+2 ... n {
        if dp[i+1][j-1] && arr[i] == arr[j] {
            dp[i][j] = true
        }
    }
}

var result = ""
let m = file.readInt()
for _ in 0 ..< m {
    let s = file.readInt()
    let e = file.readInt()
    result += dp[s][e] ? "1\n" : "0\n"
}
print(result)
