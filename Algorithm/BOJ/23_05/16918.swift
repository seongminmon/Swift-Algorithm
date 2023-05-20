//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/20.
//
// 16918 : 봄버맨
// https://www.acmicpc.net/problem/16918

import Foundation

let rcn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c,n) = (rcn[0], rcn[1], rcn[2])

var graph = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

var bombs = [[Int]](repeating: [Int](repeating: -1, count: c), count: r)
for i in 0..<r {
    for j in 0..<c {
        if graph[i][j] == "O" {
            bombs[i][j] = 1
        }
    }
}

func setBombs() {
    for i in 0..<r {
        for j in 0..<c {
            if graph[i][j] == "." {
                graph[i][j] = "O"
                bombs[i][j] = 0
            }
        }
    }
}

func boom() {
    var boomBombs = [(Int,Int)]()
    for i in 0..<r {
        for j in 0..<c {
            if bombs[i][j] >= 3 {
                boomBombs.append((i,j))
            }
        }
    }

    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]

    for (x,y) in boomBombs {
        graph[x][y] = "."
        bombs[x][y] = -1

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if 0 <= nx, nx < r, 0 <= ny, ny < c {
                graph[nx][ny] = "."
                bombs[nx][ny] = -1
            }
        }
    }
}

func timer() {
    for i in 0..<r {
        for j in 0..<c {
            if bombs[i][j] != -1 {
                bombs[i][j] += 1
            }
        }
    }
}

var time = 1
while time < n {
    timer()
    setBombs()
    time += 1
    if time >= n { break }

    timer()
    boom()
    time += 1
}

for i in graph {
    print(i.joined())
}
