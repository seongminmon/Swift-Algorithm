//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/22.
//
// 17825 : 주사위 윷놀이
// https://www.acmicpc.net/problem/17825

import Foundation

// 입력
let dice = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
// 게임 판
var root = [[Int]](repeating: [], count: 5)
root[0] = (0 ... 19).map{ $0 * 2 }
root[1] = [0, 13, 16, 19]
root[2] = [0, 22, 24]
root[3] = [0, 28, 27, 26]
root[4] = [25, 30, 35, 40, 0]

typealias Horse = (root: Int, position: Int)

// 말: 4개
var horses = [Horse](repeating: (0,0), count: 4)

func move(_ horse: Horse, jump: Int) -> (Horse, Int) {
    var nextPosition = horse.position + jump
    
    switch horse.root {
    case 0:
        if nextPosition > 20 {
            return ((4, 4), 0)
        } else if nextPosition == 20 {
            return ((4, 3), 40)
        } else if root[0][nextPosition] == 10 {
            return ((1, 0), root[0][nextPosition])
        } else if root[0][nextPosition] == 20 {
            return ((2, 0), root[0][nextPosition])
        } else if root[0][nextPosition] == 30 {
            return ((3, 0), root[0][nextPosition])
        } else {
            return ((0, nextPosition), root[0][nextPosition])
        }
    case 1:
        if nextPosition > 3 {
            return ((4, nextPosition - 4), root[4][nextPosition - 4])
        } else {
            return ((1, nextPosition), root[1][nextPosition])
        }
    case 2:
        if nextPosition > 2 {
            return ((4, nextPosition - 3), root[4][nextPosition - 3])
        } else {
            return ((2, nextPosition), root[2][nextPosition])
        }
    case 3:
        if nextPosition > 3 {
            return ((4, nextPosition - 4), root[4][nextPosition - 4])
        } else {
            return ((3, nextPosition), root[3][nextPosition])
        }
    default:
        nextPosition = min(nextPosition, 4)
        return ((4, nextPosition), root[4][nextPosition])
    }
}

var maxPoint = 0
func dfs(_ depth: Int, _ point: Int) {
    // 종료 조건
    if depth == 10 {
        maxPoint = max(maxPoint, point)
        return
    }
    
    for i in 0 ..< 4 {
        if horses[i] == (4,4) { continue }
        
        let horse = horses[i]
        let (nextHorse, nowPoint) = move(horses[i], jump: dice[depth])
        
        var check = true
        for j in 0 ..< 4 {
            if horses[j] == (4,4) || j == i { continue }
            
            if horses[j] == nextHorse {
                check = false
                break
            }
        }
        
        if check {
            horses[i] = nextHorse
            dfs(depth + 1, point + nowPoint)
            horses[i] = horse
        }
        
    }
    
}

dfs(0, 0)

// 출력
print(maxPoint)
