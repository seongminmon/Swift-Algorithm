//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/23/24.
//
// 주사위 고르기
// 2024 KAKAO WINTER INTERNSHIP
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/258709

import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    let n = dice.count

    var result = [Int]()
    var maxWin = 0

    var visited = [Bool](repeating: false, count: n)
    func diceChoice(_ depth: Int, _ start: Int) {
        // 종료 조건
        if depth == n/2 {
            // 1. A,B 주사위 고르기
            var A = [Int]()
            var B = [Int]()
            for i in 0..<n {
                if visited[i] {
                    A.append(i)
                } else {
                    B.append(i)
                }
            }

            var arrA = [Int]()
            var arrB = [Int]()
            
            var visit = [Bool](repeating: false, count: n/2)
            func calculate(_ depth: Int, _ start: Int, _ sum: Int, _ isA: Bool) {
                if depth == n/2 {
                    if isA {
                        arrA.append(sum)
                    } else {
                        arrB.append(sum)
                    }
                    return
                }
                
                for i in start..<n/2 {
                    if !visit[i] {
                        visit[i] = true
                        for j in 0..<6 {
                            var nextSum = sum
                            if isA {
                                nextSum += dice[A[i]][j]
                            } else {
                                nextSum += dice[B[i]][j]
                            }
                            calculate(depth+1, i, nextSum, isA)
                        }
                        visit[i] = false
                    }
                }
            }

            // 2. A 결과 값 구하기
            calculate(0, 0, 0, true)

            // 3. B 결과 값 구하기
            calculate(0, 0, 0, false)

            // 4. A 승리 횟수 구하기
            arrB.sort()

            // target보다 작은 숫자의 갯수 리턴
            func binarySearch(_ target: Int) -> Int {
                var start = 0
                var end = arrB.count-1
                while start <= end {
                    let mid = (start + end) / 2
                    if arrB[mid] < target {
                        start = mid + 1
                    } else {
                        end = mid - 1
                    }
                }
                return start
            }
            
            var tempWin = 0
            for i in 0..<arrA.count {
                tempWin += binarySearch(arrA[i])
            }
            
            // 5. 갱신하기
            if maxWin < tempWin {
                maxWin = tempWin
                result = A.map { $0 + 1 }
            }
            
            return
        }

        for i in start..<n {
            if !visited[i] {
                visited[i] = true
                diceChoice(depth+1, i)
                visited[i] = false
            }
        }
    }

    diceChoice(0, 0)

    return result
}

print(solution([[1, 2, 3, 4, 5, 6], [3, 3, 3, 3, 4, 4], [1, 3, 3, 4, 4, 4], [1, 1, 4, 4, 5, 5]]))
print(solution([[1, 2, 3, 4, 5, 6], [2, 2, 4, 4, 6, 6]]))
print(solution([[40, 41, 42, 43, 44, 45], [43, 43, 42, 42, 41, 41], [1, 1, 80, 80, 80, 80], [70, 70, 1, 1, 70, 70]]))
