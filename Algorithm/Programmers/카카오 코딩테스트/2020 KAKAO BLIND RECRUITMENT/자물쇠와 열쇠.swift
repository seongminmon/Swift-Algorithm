//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/27.
//
// 자물쇠와 열쇠
// 2020 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/60059

import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let (m, n) = (key.count, lock.count)
    var board = [[Int]](repeating: [Int](repeating: 0, count: 2*m + n), count: 2*m + n)

    // 자물쇠 중앙 배치
    for i in 0 ..< n {
        for j in 0 ..< n {
            board[m+i][m+j] = lock[i][j]
        }
    }

    var rotatedKey = key
    // 모든 방향 (4번 루프)
    for _ in 0 ..< 4 {
        // 키 회전
        rotatedKey = rotate90(rotatedKey)

        for x in 1 ..< m+n {
            for y in 1 ..< m+n {
                // 열쇠 넣어보기
                attach(x, y, m, rotatedKey, &board)

                // 가능한지 check
                if check(board, m, n) {
                    return true
                }

                // 열쇠 빼기
                detach(x, y, m, rotatedKey, &board)
            }
        }
    }
    return false
}

func rotate90(_ key: [[Int]]) -> [[Int]] {
    var tempKey = [[Int]](repeating: [Int](repeating: 0, count: key.count), count: key.count)

    for x in 0 ..< key.count {
        for y in 0 ..< key.count {
            tempKey[y][key.count - 1 - x] = key[x][y]
        }
    }

    return tempKey
}

func attach(_ x: Int, _ y: Int, _ m: Int, _ key: [[Int]], _ board: inout [[Int]]) {
    for i in 0 ..< m {
        for j in 0 ..< m {
            board[x+i][y+j] += key[i][j]
        }
    }
}

func detach(_ x: Int, _ y: Int, _ m: Int, _ key: [[Int]], _ board: inout [[Int]]) {
    for i in 0 ..< m {
        for j in 0 ..< m {
            board[x+i][y+j] -= key[i][j]
        }
    }
}

func check(_ board: [[Int]], _ m: Int, _ n: Int) -> Bool {
    for i in 0 ..< n {
        for j in 0 ..< n {
            if board[m+i][m+j] != 1 {
                return false
            }
        }
    }
    return true
}

print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))
