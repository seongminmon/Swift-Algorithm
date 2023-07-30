//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/24.
//
// 퍼즐 조각 채우기
// 깊이/너비 우선 탐색(DFS/BFS)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/84021

import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    // solving...
    return -1
}

print(solution(
    [[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]],
    [[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]]
))
print(solution(
    [[0,0,0],[1,1,0],[1,1,1]],
    [[1,1,1],[1,0,0],[0,0,0]]
))
