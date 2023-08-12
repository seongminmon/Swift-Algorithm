//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/08.
//
// 카드 짝 맞추기
// 2021 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/72415

import Foundation

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    var board = board

    var cards = [(Int,Int,Int)]()
    for i in 0..<4 {
        for j in 0..<4 {
            if board[i][j] != 0 {
                cards.append((i, j, board[i][j]))
            }
        }
    }
    // 카드 번호 순으로 정렬
    cards.sort { $0.2 < $1.2 }

    var ans = Int.max
    var cardVisited = [Bool](repeating: false, count: cards.count)
    func permutation(_ order: [(Int,Int)], _ cnt: Int) {
        // 조기 탈출
        if cnt > ans { return }

        // 종료 조건
        if order.count == cards.count+1 {
            ans = min(ans, cnt)
            return
        }

        for i in stride(from: 0, to: cards.count, by: 2) {
            if !cardVisited[i] {
                let card1 = (cards[i].0, cards[i].1)
                let card2 = (cards[i+1].0, cards[i+1].1)
                let cardNum = cards[i].2

                var firstCnt = cnt + bfs(order.last!, card1) + bfs(card1, card2)
                var secondCnt = cnt + bfs(order.last!, card2) + bfs(card2, card1)

                // 카드 삭제
                cardVisited[i] = true
                cardVisited[i+1] = true
                board[card1.0][card1.1] = 0
                board[card2.0][card2.1] = 0

                // 재귀 호출
                permutation(order + [card1, card2], firstCnt)
                permutation(order + [card2, card1], secondCnt)

                // 복구
                cardVisited[i] = false
                cardVisited[i+1] = false
                board[card1.0][card1.1] = cardNum
                board[card2.0][card2.1] = cardNum
            }
        }
    }

    func bfs(_ start: (Int,Int), _ end: (Int,Int)) -> Int {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: 4), count: 4)
        visited[start.0][start.1] = true
        var queue = [(start.0, start.1, 0)]
        var idx = 0

        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]

        func isValid(_ x: Int, _ y: Int) -> Bool {
            return 0 <= x && x < 4 && 0 <= y && y < 4
        }

        while idx < queue.count {
            let (x, y, cnt) = queue[idx]
            idx += 1

            // 종료 조건
            if x == end.0 && y == end.1 {
                return cnt
            }

            for i in 0..<4 {
                var nx = x + dx[i]
                var ny = y + dy[i]

                // 1. 방향키
                if isValid(nx, ny) && !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx, ny, cnt+1))
                }

                // 2. 컨트롤 + 방향키
                while isValid(nx, ny) && board[nx][ny] == 0 {
                    nx += dx[i]
                    ny += dy[i]
                }
                if !isValid(nx, ny) {
                    nx -= dx[i]
                    ny -= dy[i]
                }

                if !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx, ny, cnt+1))
                }
            }
        }

        return -1
    }

    permutation([(r,c)], 0)

    return ans + cards.count
}

print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))
print(solution([[3,0,0,2],[0,0,1,0],[0,1,0,0],[2,0,0,3]], 0, 1))
