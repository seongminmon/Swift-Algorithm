//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/10.
//
// 18808 : 스티커 붙이기
// https://www.acmicpc.net/problem/18808

import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
outerLoop: for _ in 0..<k {
    let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (r,c) = (rc[0], rc[1])
    
    var sticker = [[Int]]()
    for _ in 0..<r {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        sticker.append(input)
    }
    
    for _ in 0..<4 {
        for i in 0..<n {
            for j in 0..<m {
                if i+r <= n && j+c <= m {
                    if find(i,j) {
                        continue outerLoop
                    }
                }
            }
        }
        sticker = rotate(sticker)
        (r,c) = (c,r)
    }
    
    func find(_ sx: Int, _ sy: Int) -> Bool {
        for i in 0..<r {
            for j in 0..<c {
                if map[sx+i][sy+j] == 1 && sticker[i][j] == 1 {
                    return false
                }
            }
        }
        
        for i in 0..<r {
            for j in 0..<c {
                if sticker[i][j] == 1 {
                    map[sx+i][sy+j] = 1
                }
            }
        }
        
        return true
    }
    
    func rotate(_ sticker: [[Int]]) -> [[Int]] {
        var newSticker = [[Int]](repeating: [Int](repeating: 0, count: r), count: c)
        for i in 0..<r {
            for j in 0..<c {
                newSticker[j][r-1-i] = sticker[i][j]
            }
        }
        return newSticker
    }
}

var ans = 0
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 1 {
            ans += 1
        }
    }
}
print(ans)
