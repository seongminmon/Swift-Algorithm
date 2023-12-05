//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/09.
//
// 15686 : 치킨 배달
// https://www.acmicpc.net/problem/15686

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

var house = [(Int,Int)]()
var chicken = [(Int,Int)]()
for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == 1 {
            house.append((i,j))
        } else if graph[i][j] == 2 {
            chicken.append((i,j))
        }
    }
}

// 1. 페업시키지 않을 치킨집 m개 고르기
var ans = Int.max
var chickenVisited = [Bool](repeating: false, count: chicken.count)
func selectChicken(_ depth: Int, _ start: Int) {
    if depth == m {
        ans = min(ans, findDistance())
        return
    }
    
    for i in start..<chicken.count {
        if !chickenVisited[i] {
            chickenVisited[i] = true
            selectChicken(depth+1, i)
            chickenVisited[i] = false
        }
    }
}

// 2. 치킨 거리 구하기
func findDistance() -> Int {
    var ret = 0
    for (x1,y1) in house {
        var minDist = Int.max
        for j in 0..<chicken.count {
            if chickenVisited[j] {
                let (x2,y2) = chicken[j]
                let dist = abs(x1-x2) + abs(y1-y2)
                minDist = min(minDist, dist)
            }
        }
        ret += minDist
    }
    return ret
}

selectChicken(0, 0)

print(ans)
