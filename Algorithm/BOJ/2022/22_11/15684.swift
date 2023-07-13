//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/06.
//
// 15684 : 사다리 조작
// https://www.acmicpc.net/problem/15684

import Foundation

// 입력
let nmh = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,h) = (nmh[0], nmh[1], nmh[2])
var garo = [(Int,Int)]()
for _ in 0 ..< m {
    let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
    garo.append((ab[0] - 1, ab[1] - 1))
}

// 풀이
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n-1), count: h)
for (height, num) in garo {
    visited[height][num] = true
}

func dfs(_ depth: Int, _ start: Int) {
    // 종료 조건
    if depth == 1 {
        if check() {
            result.append(1)
        }
    } else if depth == 2 {
        if check() {
            result.append(2)
        }
    } else if depth == 3 {
        if check() {
            result.append(3)
        }
        return
    }
    
    for i in start ..< h {
        for j in 0 ..< n-1 {
            if !visited[i][j] {
                visited[i][j] = true
                dfs(depth+1, i)
                visited[i][j] = false
            }
        }
    }
}

func check() -> Bool {
    var check = true
    
    for i in 0 ..< n {
        var result = i
        
        for j in 0 ..< h {
            // 오른쪽 이동
            if result < n-1, visited[j][result] {
                result += 1
            }
            // 왼쪽 이동
            else if 0 < result, visited[j][result-1] {
                result -= 1
            }
        }
        
        if result != i {
            check = false
            break
        }
    }
    return check
}

var result = [Int]()
if check() {
    result.append(0)
} else {
    dfs(0,0)
}

// 출력
if result.isEmpty {
    print(-1)
} else {
    print(result.min()!)
}
