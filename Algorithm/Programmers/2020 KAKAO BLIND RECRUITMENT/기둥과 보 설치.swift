//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/27.
//
// 기둥과 보 설치
// 2020 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/60061

import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var map = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 2), count: n+1), count: n+1)
    
    func canBuild(_ x: Int, _ y: Int, _ a: Int) -> Bool {
        if a == 0 {
            // 기둥 설치
            // 1. 바닥 위에 있거나
            // 2. 보의 한쪽 끝 부분 위에 있거나
            // 3. 다른 기둥위에 있거나
            if y == 0 ||
                map[x][y][1] ||
                (x-1 >= 0 && map[x-1][y][1]) ||
                (y-1 <= n && map[x][y-1][0]) {
                return true
            } else {
                return false
            }
        } else {
            // 보 설치
            // 1. 한쪽 끝 부분이 기둥 위에 있거나
            // 2. 양쪽 끝 부분이 다른 보와 동시에 연결되어 있거나
            if (y-1 >= 0 && map[x][y-1][0]) ||
                (x+1 <= n && y-1 >= 0 && map[x+1][y-1][0]) ||
                (x-1 >= 0 && x+1 <= n && map[x-1][y][1] && map[x+1][y][1]) {
                return true
            } else {
                return false
            }
        }
    }
    
    func canDelete(_ x: Int, _ y: Int) -> Bool {
        for i in x-1...x+1 {
            for j in y-1...y+1 {
                for k in 0..<2 {
                    if 0 <= i && i <= n && 0 <= j && j <= n {
                        if map[i][j][k] && !canBuild(i, j, k) {
                            return false
                        }
                    }
                }
            }
        }
        return true
    }
    
    for build in build_frame {
        let (x, y, a, b) = (build[0], build[1], build[2], build[3])
        if b == 0 {
            // 삭제
            map[x][y][a] = false
            if !canDelete(x, y) {
                map[x][y][a] = true
            }
        } else {
            // 설치
            if canBuild(x, y, a) {
                map[x][y][a] = true
            }
        }
    }
    
    var result = [[Int]]()
    for i in 0...n {
        for j in 0...n {
            for k in 0..<2 {
                if map[i][j][k] {
                    result.append([i, j, k])
                }
            }
        }
    }
    return result
}

print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))
