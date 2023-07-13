//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/11.
//
// 3190 : 뱀
// https://www.acmicpc.net/problem/3190

import Foundation

// 입력
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var apple = [(Int,Int)]()
for _ in 0 ..< k {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    apple.append((xy[0]-1, xy[1]-1))
}
let l = Int(readLine()!)!
var turn = [(Int, String)]()
for _ in 0 ..< l {
    let xd = readLine()!.split(separator: " ").map { String($0) }
    turn.append((Int(xd[0])!, xd[1]))
}

// 풀이
// 뱀이 (0,0)에 위치, 오른쪽 바라봄
// 0은 빈칸, 1은 사과, 2는 뱀
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
graph[0][0] = 2
for (i,j) in apple {
    graph[i][j] = 1
}

// 뱀 좌표
var snake = [(Int,Int)](repeating: (0,0), count: 1)
// 머리 방향
// 0: 우, 1: 상, 2: 좌, 3: 하
var direct = 0
let dx = [0,-1,0,1]
let dy = [1,0,-1,0]

// 게임 진행
var cnt = 0
while true {
    // 방향 전환
    for (t, d) in turn {
        if cnt == t {
            if d == "L" {
                direct += 1
                if direct == 4 {
                    direct = 0
                }
            } else {
                direct -= 1
                if direct == -1 {
                    direct = 3
                }
            }
        }
    }
    
    // 한칸 이동
    let head = (snake[0].0, snake[0].1)
    let nx = head.0 + dx[direct]
    let ny = head.1 + dy[direct]
    
    // 벽에 부딪히거나 자기 몸에 부딪힐 시 종료
    if nx < 0 || nx >= n || ny < 0 || ny >= n || graph[nx][ny] == 2 {
        cnt += 1
        break
    } else {
        // 사과 있을 경우
        if graph[nx][ny] == 1 {
            snake.insert((nx,ny), at: 0)
            graph[nx][ny] = 2
        }
        // 사과 없을 경우
        else {
            snake.insert((nx,ny), at: 0)
            let tail = snake.removeLast()
            graph[nx][ny] = 2
            graph[tail.0][tail.1] = 0
        }
    }
    cnt += 1
}

// 출력
print(cnt)
