//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/22.
//
// 3025 : 돌 던지기
// https://www.acmicpc.net/problem/3025

import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c) = (rc[0], rc[1])

var board = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    board.append(input)
}

var stacks = [[(Int,Int)]](repeating: [], count: c)
func falling(_ x: Int, _ y: Int, _ location: Int) {
    var (x,y) = (x,y)
    
    while true {
        stacks[location].append((x,y))
        
        if x+1 == r || board[x+1][y] == "X" { break }
        
        if board[x+1][y] == "O" {
            if y-1 >= 0 && board[x][y-1] == "." && board[x+1][y-1] == "." {
                y -= 1
            } else if y+1 < c && board[x][y+1] == "." && board[x+1][y+1] == "." {
                y += 1
            } else {
                break
            }
        }
        x += 1
    }
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let location = Int(readLine()!)! - 1
    
    while let (x,y) = stacks[location].last {
        if board[x][y] == "." { break }
        stacks[location].removeLast()
    }
    
    var (x,y) = (0, location)
    if !stacks[location].isEmpty {
        (x,y) = stacks[location].removeLast()
    }
    falling(x, y, location)
    
    (x,y) = stacks[location].removeLast()
    board[x][y] = "O"
}

var ans = ""
for i in 0..<r {
    ans += "\(board[i].joined())\n"
}
print(ans)
