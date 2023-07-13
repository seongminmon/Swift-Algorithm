//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/19.
//
// 18428 : 감시 피하기
// https://www.acmicpc.net/problem/18428

import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n)
var tList = [(Int,Int)]()
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    var intInput = [Int]()
    for j in 0 ..< n {
        switch input[j] {
            case "X": intInput.append(0)
            case "T":
            intInput.append(1)
            tList.append((i,j))
            default: intInput.append(2)
        }
    }
    graph[i] = intInput
}

// 풀이
// 빈칸: 0, 선생님: 1, 학생: 2, 장애물: 3
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
func dfs(_ depth: Int, _ start: Int) {
    // 장애물 3개 설치 완료시
    if depth == 3 {
        for (x,y) in tList {
            for i in 0 ..< 4 {
                var nx = x + dx[i]
                var ny = y + dy[i]
                
                while 0 <= nx, nx < n, 0 <= ny, ny < n {
                    if graph[nx][ny] == 2 {
                        return
                    }
                    
                    if graph[nx][ny] == 3 {
                        break
                    }
                    
                    nx += dx[i]
                    ny += dy[i]
                }
            }
        }
        
        result = true
        return
    }
    
    // 재귀적으로 장애물 설치
    for i in start ..< n {
        for j in 0 ..< n {
            if graph[i][j] == 0 {
                graph[i][j] = 3
                dfs(depth+1, i)
                graph[i][j] = 0
            }
        }
    }
}

var result = false
dfs(0, 0)

// 출력
if result {
    print("YES")
} else {
    print("NO")
}
