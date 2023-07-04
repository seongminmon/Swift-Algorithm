//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/04.
//
// 19237 : 어른 상어
// https://www.acmicpc.net/problem/19237

import Foundation

// 입력
let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var board = [[[Int]]](repeating: [[Int]](repeating: [], count: n), count: n)
var smells = [[[Int]]](repeating: [[Int]](repeating: [0,0], count: n), count: n)
var sharks = [(Int,Int)](repeating: (-1,-1), count: m+1)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    for j in 0 ..< n {
        if input[j] > 0 {
            board[i][j].append(input[j])
            smells[i][j] = [input[j], k]
            sharks[input[j]] = (i, j)
        }
    }
}

var directions = [0] + readLine()!.split(separator: " ").map{ Int(String($0))! }

var priority = [[[Int]]](repeating: [[Int]](repeating: [], count: 5), count: m+1)
for i in 1 ... m {
    for j in 1 ... 4 {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        priority[i][j] = input
    }
}

// 풀이
let dx = [0, -1, 1, 0, 0]
let dy = [0, 0, 0, -1, 1]

func move() {
    for num in 1 ... m {
        let (x, y) = sharks[num]
        if x < 0 || x >= n || y < 0 || y >= n {
            continue
        }
        
        var positions = searchBlank(num, x, y, directions[num])
        if positions.isEmpty {
            positions = searchMySmell(num, x, y, directions[num])
        }
        
        // 이동 불가
        if positions.isEmpty {
            continue
        }
        
        // 이동
        let (nx, ny, nd) = (positions[0][0], positions[0][1], positions[0][2])
        board[nx][ny].append(board[x][y].removeLast())
        sharks[num] = (nx, ny)
        directions[num] = nd
    }
}

func searchBlank(_ num: Int, _ x: Int, _ y: Int, _ d: Int) -> [[Int]] {
    var positions = [[Int]]()
    for nd in priority[num][d] {
        let nx = x + dx[nd]
        let ny = y + dy[nd]
        if 0 <= nx, nx < n, 0 <= ny, ny < n {
            if smells[nx][ny][1] == 0 {
                positions.append([nx, ny, nd])
            }
        }
    }
    
    return positions
}

func searchMySmell(_ num: Int, _ x: Int, _ y: Int, _ d: Int) -> [[Int]] {
    var positions = [[Int]]()
    for nd in priority[num][d] {
        let nx = x + dx[nd]
        let ny = y + dy[nd]
        if 0 <= nx, nx < n, 0 <= ny, ny < n {
            if smells[nx][ny][0] == num {
                positions.append([nx, ny, nd])
            }
        }
    }
    
    return positions
}

func out() {
    for x in 0 ..< n {
        for y in 0 ..< n {
            if board[x][y].count >= 2 {
                let minSharkNum = board[x][y].min()!
                for num in board[x][y] {
                    if num != minSharkNum {
                        sharks[num] = (-1, -1)
                    }
                }
                board[x][y] = [minSharkNum]
            }
        }
    }
}

func smellDown() {
    for x in 0 ..< n {
        for y in 0 ..< n {
            if smells[x][y][1] > 0 {
                smells[x][y][1] -= 1
                if smells[x][y][1] == 0 {
                    smells[x][y][0] = 0
                }
            }
            
            if !board[x][y].isEmpty {
                smells[x][y] = [board[x][y][0], k]
            }
        }
    }
}

func isEnd() -> Bool {
    var cnt = 0
    for i in 0 ..< sharks.count {
        if sharks[i] != (-1,-1) {
            cnt += 1
        }
    }
    
    if cnt == 1 { return true }
    return false
}

var result = -1
for t in 0 ... 1000 {
    if isEnd() {
        result = t
        break
    }
    move()
    out()
    smellDown()
}

// 출력
print(result)
