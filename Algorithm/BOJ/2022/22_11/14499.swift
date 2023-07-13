//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/06.
//
// 14499 : 주사위 굴리기
// https://www.acmicpc.net/problem/14499

import Foundation

// 입력
let nmxyk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,x,y,k) = (nmxyk[0], nmxyk[1], nmxyk[2], nmxyk[3], nmxyk[4])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}
let command = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
// 주사위 초기화
// 북, 상단, 남, 바닥, 서, 동
var dice = [0, 0, 0, 0, 0, 0]
var diceLocation = (x,y)
// 없음, 동, 서, 북, 남
let dx = [0, 0, 0, -1, 1]
let dy = [0, 1, -1, 0, 0]

var result = [Int]()
for c in command {
    let nx = diceLocation.0 + dx[c]
    let ny = diceLocation.1 + dy[c]
    
    if 0 <= nx, nx < n, 0 <= ny, ny < m {
        // dice 위치, 상태 변경
        diceLocation = (nx, ny)
        switch c {
        case 1: dice = [dice[0], dice[4], dice[2], dice[5], dice[3], dice[1]]
        case 2: dice = [dice[0], dice[5], dice[2], dice[4], dice[1], dice[3]]
        case 3: dice = [dice[1], dice[2], dice[3], dice[0], dice[4], dice[5]]
        default: dice = [dice[3], dice[0], dice[1], dice[2], dice[4], dice[5]]
        }
        
        // 칸에 따라 상태 변경
        if graph[nx][ny] == 0 {
            graph[nx][ny] = dice[3]
        } else {
            dice[3] = graph[nx][ny]
            graph[nx][ny] = 0
        }
        
        // 상단 result에 추가
        result.append(dice[1])
    }
}

// 출력
for i in result { print(i) }
