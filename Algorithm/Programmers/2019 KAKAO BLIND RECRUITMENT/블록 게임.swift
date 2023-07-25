//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/25.
//
// 블록 게임
// 2019 KAKAO BLIND RECRUITMENT
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/42894

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    var board = board

    // 내 위가 모두 빈칸이면 검은색 블록을 채울 수 있음
    func canFill(_ x: Int, _ y: Int) -> Bool {
        for i in 0..<x {
            if board[i][y] != 0 {
                return false
            }
        }
        return true
    }

    func canDelete(_ x: Int, _ y: Int, _ h: Int, _ w: Int) -> Bool {
        // 빈칸 2칸 + 블록 4칸
        // 빈칸은 모두 검은 블록으로 채울 수 있어야 함
        // 블록의 숫자는 모두 같아야 함
        var emptyCnt = 0
        var value = -1
        for i in x..<x+h {
            for j in y..<y+w {
                if board[i][j] == 0 {
                    emptyCnt += 1
                    // 빈칸이 두칸 이상이면 x
                    if emptyCnt > 2 {
                        return false
                    }
                    // 채울 수 없는 빈칸이면 x
                    if !canFill(i, j) {
                        return false
                    }
                } else {
                    if value == -1 {
                        value = board[i][j]
                    } else {
                        // 다른 블록이 섞여 있으면 x
                        if value != board[i][j] {
                            return false
                        }
                    }
                }
            }
        }

        // 블록 삭제
        for i in x..<x+h {
            for j in y..<y+w {
                board[i][j] = 0
            }
        }
        return true
    }

    var ans = 0
    while true {
        // 삭제한 블록 갯수
        var cnt = 0
        for i in 0..<n {
            for j in 0..<n {
                // 2*3, 3*2 확인
                if i+2 <= n && j+3 <= n && canDelete(i, j, 2, 3) {
                    cnt += 1
                } else if i+3 <= n && j+2 <= n && canDelete(i, j, 3, 2) {
                    cnt += 1
                }
            }
        }

        if cnt == 0 { break }
        ans += cnt
    }

    return ans
}

print(solution([[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,4,0,0,0],[0,0,0,0,0,4,4,0,0,0],[0,0,0,0,3,0,4,0,0,0],[0,0,0,2,3,0,0,0,5,5],[1,2,2,2,3,3,0,0,0,5],[1,1,1,0,0,0,0,0,0,5]]))
