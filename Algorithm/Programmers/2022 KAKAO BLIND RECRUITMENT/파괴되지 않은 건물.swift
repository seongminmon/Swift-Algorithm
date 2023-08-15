//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/14.
//
// 파괴되지 않은 건물
// 2022 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/92344

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    let n = board.count
    let m = board[0].count

    var changeBoard = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    for s in skill {
        let type = s[0]
        let (r1, c1, r2, c2) = (s[1], s[2], s[3], s[4])
        let degree = type == 1 ? -s[5] : s[5]

        changeBoard[r1][c1] += degree
        changeBoard[r2+1][c2+1] += degree
        changeBoard[r2+1][c1] -= degree
        changeBoard[r1][c2+1] -= degree
    }

    // 누적합
    // 1. 왼쪽 -> 오른쪽
    for i in 0..<n {
        for j in 1..<m {
            changeBoard[i][j] += changeBoard[i][j-1]
        }
    }

    // 2. 위 -> 아래
    for i in 1..<n {
        for j in 0..<m {
            changeBoard[i][j] += changeBoard[i-1][j]
        }
    }

    var cnt = 0
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] + changeBoard[i][j] > 0 {
                cnt += 1
            }
        }
    }
    return cnt
}

print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
print(solution([[1,2,3],[4,5,6],[7,8,9]], [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]]))
