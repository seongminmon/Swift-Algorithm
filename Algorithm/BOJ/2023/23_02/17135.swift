//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/11.
//
// 17135 : 캐슬 디펜스
// https://www.acmicpc.net/problem/17135

import Foundation

let nmd = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,d) = (nmd[0], nmd[1], nmd[2])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

var result = 0
var archers = [Bool](repeating: false, count: m)
var archerHeight = n
var enemyCnt = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if graph[i][j] == 1 {
            enemyCnt += 1
        }
    }
}

func dfs(_ depth: Int, _ start: Int) {
    if depth == 3 {
        result = max(result, play())
        return
    }
    
    for i in start ..< m {
        if !archers[i] {
            archers[i] = true
            dfs(depth+1, i)
            archers[i] = false
        }
    }
}

func play() -> Int {
    archerHeight = n
    var graph = graph
    var targetCnt = 0
    var totalCnt = 0
    
    while totalCnt != enemyCnt {
        var targetList = [(Int,Int)]()
        for i in 0 ..< m {
            if archers[i] {
                if let target = makeTarget(archerHeight, i, graph) {
                    targetList.append(target)
                }
            }
        }
        
        for (tx,ty) in targetList {
            if graph[tx][ty] == 1 {
                graph[tx][ty] = 0
                totalCnt += 1
                targetCnt += 1
            }
        }
        
        archerHeight -= 1
        for i in 0 ..< m {
            if graph[archerHeight][i] == 1 {
                totalCnt += 1
            }
        }
    }
    
    return targetCnt
}

func makeTarget(_ x: Int, _ y: Int, _ graph: [[Int]]) -> (Int,Int)? {
    var targets = [(Int,Int,Int)]()
    for i in 0 ..< archerHeight {
        for j in 0 ..< m {
            if graph[i][j] == 1 {
                let dist = abs(x-i) + abs(y-j)
                if dist <= d {
                    targets.append((i,j,dist))
                }
            }
        }
    }
    
    targets.sort {
        if $0.2 == $1.2 {
            return $0.1 < $1.1
        } else {
            return $0.2 < $1.2
        }
    }
    
    if let target = targets.first {
        return (target.0, target.1)
    }
    return nil
}

dfs(0,0)

print(result)
