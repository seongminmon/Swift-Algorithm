//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/16.
//
// 1062 : 가르침
// https://www.acmicpc.net/problem/1062

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var (n,k) = (nk[0], nk[1])

// 1. 비트마스크 X
//let alphabet = Array(Set("antatica"))
//var words = [[Character]]()
//for _ in 0..<n {
//    // 전처리: 중복 제거 + antic 제거
//    let word = Array(Set(readLine()!).subtracting(Set(alphabet)))
//    words.append(word)
//}
//
//var ans = 0
//var visited = [Bool](repeating: false, count: 26)
//func dfs(_ depth: Int, _ start: Int) {
//    // 종료 조건
//    if depth == k {
//        var cnt = 0
//        for word in words {
//            var flag = true
//
//            for ch in word {
//                let idx = Int(ch.asciiValue! - Character("a").asciiValue!)
//                if !visited[idx] {
//                    flag = false
//                    break
//                }
//            }
//
//            if flag { cnt += 1 }
//        }
//
//        ans = max(ans, cnt)
//        return
//    }
//
//    for i in start..<26 {
//        if !visited[i] {
//            visited[i] = true
//            dfs(depth+1, i)
//            visited[i] = false
//        }
//    }
//}
//
//if k < 5 {
//    print(0)
//} else {
//    for i in 0..<5 {
//        let idx = Int(alphabet[i].asciiValue! - Character("a").asciiValue!)
//        visited[idx] = true
//    }
//    k -= 5
//
//    dfs(0, 0)
//    print(ans)
//}

// 2. 비트마스크
var bitmaskArr = [Int](repeating: 0, count: n)
for i in 0..<n {
    let word = Array(readLine()!)
    for ch in word {
        bitmaskArr[i] |= 1 << (Int(ch.asciiValue! - Character("a").asciiValue!))
    }
}

let alphabet = Array("antic")
var bitmask = 0
for ch in alphabet {
    bitmask |= 1 << Int(ch.asciiValue! - Character("a").asciiValue!)
}

var ans = 0
func dfs(_ depth: Int, _ start: Int) {
    // 종료 조건
    if depth == k {
        var cnt = 0
        for i in 0..<n {
            if bitmaskArr[i] & bitmask == bitmaskArr[i] {
                cnt += 1
            }
        }
        ans = max(ans, cnt)
    }
    
    for i in start..<26 {
        if bitmask & (1<<i) == 0 {
            bitmask |= (1<<i)
            dfs(depth+1, i)
            bitmask &= ~(1<<i)
        }
    }
}

if k < 5 {
    print(0)
} else {
    k -= 5
    dfs(0, 0)
    print(ans)
}
