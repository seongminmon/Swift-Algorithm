//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/28.
//
// 8972 : 미친 아두이노
// https://www.acmicpc.net/problem/8972

import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c) = (rc[0], rc[1])
var map = [[String]]()
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    map.append(input)
}
var directions = readLine()!.map { Int(String($0))!-1 }

var arduino = (-1,-1)
var crazyArduinos = [(Int,Int)]()
for i in 0..<r {
    for j in 0..<c {
        if map[i][j] == "I" {
            arduino = (i,j)
        } else if map[i][j] == "R" {
            crazyArduinos.append((i,j))
        }
    }
}

let dx = [1, 1, 1, 0, 0, 0, -1, -1, -1]
let dy = [-1, 0, 1, -1, 0, 1, -1, 0, 1]

var isFinish = false
var cnt = 0
outerLoop: while cnt < directions.count {
    let (x,y) = arduino
    let d = directions[cnt]
    
    let nx = arduino.0 + dx[d]
    let ny = arduino.1 + dy[d]
    
    cnt += 1
    
    if map[nx][ny] == "R" {
        isFinish = true
        break outerLoop
    } else {
        map[x][y] = "."
        map[nx][ny] = "I"
        arduino = (nx,ny)
    }
    
    for i in 0..<crazyArduinos.count {
        let (a,b) = crazyArduinos[i]
        
        var minDirection = -1
        var minDist = Int.max
        for j in 0..<9 {
            let na = a + dx[j]
            let nb = b + dy[j]
            
            let dist = abs(na-nx) + abs(nb-ny)
            if minDist > dist {
                minDist = dist
                minDirection = j
            }
        }
        
        let na = a + dx[minDirection]
        let nb = b + dy[minDirection]
        
        if map[na][nb] == "I" {
            isFinish = true
            break outerLoop
        }
        
        map[a][b] = "."
        crazyArduinos[i] = (na,nb)
    }
    
    // 4.
    var deleteArduinos = [(Int,Int)]()
    for (na,nb) in crazyArduinos {
        if map[na][nb] == "R" {
            deleteArduinos.append((na,nb))
        } else {
            map[na][nb] = "R"
        }
    }
    
    for (da,db) in deleteArduinos {
        map[da][db] = "."
    }
    
    var newCrazyArduinos = [(Int,Int)]()
    for i in 0..<r {
        for j in 0..<c {
            if map[i][j] == "R" {
                newCrazyArduinos.append((i,j))
            }
        }
    }
    crazyArduinos = newCrazyArduinos
}

if isFinish {
    print("kraj", cnt)
} else {
    for i in 0..<r {
        print(map[i].joined())
    }
}
