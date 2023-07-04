//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 9663 : N-Queen
// https://www.acmicpc.net/problem/9663

import Foundation

// 입력
let n = Int(readLine()!)!

// 풀이
// 인덱스: 열, 값: 행 (어차피 같은 열에는 하나밖에 둘 수 없기 때문에)
var queens = [Int](repeating: -1, count: n)
var result = 0

func dfs(_ depth: Int) {
    // 종료 조건
    if depth == n {
        result += 1
        return
    }
    
    for i in 0 ..< n {
        if check(depth, i) {
            queens[depth] = i
            dfs(depth+1)
            queens[depth] = -1
        }
    }
}

func check(_ x: Int, _ y: Int) -> Bool {
    for i in 0 ..< x {
        if y == queens[i] ||
            abs(x - i) == abs(y - queens[i]) {
            return false
        }
    }
    
    return true
}

dfs(0)

// 출력
print(result)
