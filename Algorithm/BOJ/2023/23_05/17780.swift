//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/15.
//
// 17780 : 새로운 게임
// https://www.acmicpc.net/problem/17780

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var board = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    board.append(input)
}

var horsesOnBoard = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: n)
var horses = [[Int]]()
for i in 0..<k {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!-1 }
    horses.append(input)
    horsesOnBoard[input[0]][input[1]].append(i)
}

let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var ans = 0
outerLoop: while ans <= 1000 {
    ans += 1
    
    for i in 0..<k {
        let x = horses[i][0]
        let y = horses[i][1]
        let d = horses[i][2]
        
        if horsesOnBoard[x][y].first != i {
            continue
        }
        
        var nx = x + dx[d]
        var ny = y + dy[d]
        
        if nx < 0 || nx >= n || ny < 0 || ny >= n || board[nx][ny] == 2 {
            let bx = x - dx[d]
            let by = y - dy[d]
            
            if bx < 0 || bx >= n || by < 0 || by >= n || board[bx][by] == 2 {
                continue
            }
            
            horses[i][2] += (d == 0 || d == 2) ? 1 : -1
            nx = bx
            ny = by
        }
        
        let idx = horsesOnBoard[x][y].firstIndex(of: i)!
        var arr = Array(horsesOnBoard[x][y][idx...])
        if board[nx][ny] == 1 { arr = arr.reversed() }
        
        horsesOnBoard[x][y] = Array(horsesOnBoard[x][y][..<idx])
        horsesOnBoard[nx][ny] += arr
        
        // 종료 조건
        if horsesOnBoard[nx][ny].count >= 4 { break outerLoop
        }
        
        for j in arr {
            horses[j][0] = nx
            horses[j][1] = ny
        }
    }
}

print(ans > 1000 ? -1 : ans)
