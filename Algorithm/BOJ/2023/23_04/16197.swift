//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/29.
//
// 16197 : 두 동전
// https://www.acmicpc.net/problem/16197

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var board = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    board.append(input)
}

var coin1 = (-1,-1)
var coin2 = (-1,-1)
for i in 0 ..< n {
    for j in 0 ..< m {
        if board[i][j] == "o" {
            if coin1 == (-1,-1) {
                coin1 = (i,j)
            } else {
                coin2 = (i,j)
            }
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func isIn(_ xy: (Int,Int)) -> Bool {
    let x = xy.0
    let y = xy.1
    if 0 <= x, x < n, 0 <= y, y < m {
        return true
    } else {
        return false
    }
}

var result = Int.max
func solve(_ c1: (Int,Int), _ c2: (Int,Int), _ cnt: Int) {
    // 횟수 초과시 리턴
    if cnt > 10 { return }
    
    let isIn1 = isIn(c1)
    let isIn2 = isIn(c2)
    
    // 둘다 떨어졌을 시 리턴
    if !isIn1, !isIn2 { return }
    
    // 하나만 떨어졌을 시 횟수 갱신 후 리턴
    if !isIn1 || !isIn2 {
        result = min(result, cnt)
        return
    }
    
    for i in 0 ..< 4 {
        var nc1 = (c1.0 + dx[i], c1.1 + dy[i])
        var nc2 = (c2.0 + dx[i], c2.1 + dy[i])
        
        if isIn(nc1), board[nc1.0][nc1.1] == "#" {
            nc1 = c1
        }
        
        if isIn(nc2), board[nc2.0][nc2.1] == "#" {
            nc2 = c2
        }
        
        solve(nc1, nc2, cnt+1)
    }
}

solve(coin1, coin2, 0)
print(result == Int.max ? -1 : result)
