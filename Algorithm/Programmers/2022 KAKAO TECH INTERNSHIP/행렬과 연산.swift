//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/20.
//
// 행렬과 연산
// 2022 KAKAO TECH INTERNSHIP
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/118670

import Foundation

// 정확성 테스트
func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
    let n = rc.count
    let m = rc[0].count

    func shiftRow(_ arr: [[Int]]) -> [[Int]] {
        var newArr = arr
        for i in 0..<n {
            if i == 0 {
                newArr[i] = arr[n-1]
            } else {
                newArr[i] = arr[i-1]
            }
        }
        return newArr
    }

    func rotate(_ arr: [[Int]]) -> [[Int]] {
        var newArr = arr
        // 첫 행
        for j in 1..<m {
            newArr[0][j] = arr[0][j-1]
        }
        // 끝 열
        for i in 1..<n {
            newArr[i][m-1] = arr[i-1][m-1]
        }
        // 끝 행
        for j in stride(from: m-2, through: 0, by: -1) {
            newArr[n-1][j] = arr[n-1][j+1]
        }
        // 첫 열
        for i in stride(from: n-2, through: 0, by: -1) {
            newArr[i][0] = arr[i+1][0]
        }
        return newArr
    }

    var rc = rc
    for op in operations {
        if op == "ShiftRow" {
            rc = shiftRow(rc)
        } else {
            rc = rotate(rc)
        }
    }

    return rc
}

// 효율성 테스트 (시간 초과)
//struct Deque<T> {
//    var queue: [T] = []
//
//    mutating func pushFirst(_ x: T) {
//        var reversedQueue: [T] = queue.reversed()
//        reversedQueue.append(x)
//        queue = reversedQueue.reversed()
//    }
//
//    mutating func pushLast(_ x: T) {
//        queue.append(x)
//    }
//
//    mutating func popFirst() -> T? {
//        var reversedQueue: [T] = queue.reversed()
//        let ret = reversedQueue.removeLast()
//        queue = reversedQueue.reversed()
//        return ret
//    }
//
//    mutating func popLast() -> T? {
//        return queue.removeLast()
//    }
//}
//
//func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
//    let n = rc.count
//    let m = rc[0].count
//
//    // Deque 생성
//    var middle = Deque<Deque<Int>>()
//    var left = Deque<Int>()
//    var right = Deque<Int>()
//
//    for i in 0..<n {
//        left.pushLast(rc[i][0])
//
//        middle.pushLast(Deque())
//        for j in stride(from: 1, to: m-1, by: 1) {
//            middle.queue[i].pushLast(rc[i][j])
//        }
//
//        right.pushLast(rc[i][m-1])
//    }
//
//    func shiftRow() {
//        middle.pushFirst(middle.popLast()!)
//        left.pushFirst(left.popLast()!)
//        right.pushFirst(right.popLast()!)
//    }
//
//    func rotate() {
//        if m > 2 {
//            right.pushFirst(middle.queue[0].popLast()!)
//            middle.queue[n-1].pushLast(right.popLast()!)
//            left.pushLast(middle.queue[n-1].popFirst()!)
//            middle.queue[0].pushFirst(left.popFirst()!)
//        } else {
//            right.pushFirst(left.popFirst()!)
//            left.pushLast(right.popLast()!)
//        }
//    }
//
//    // 명령 실행
//    for op in operations {
//        if op == "ShiftRow" {
//            shiftRow()
//        } else {
//            rotate()
//        }
//    }
//
//    // Deque -> 배열
//    var result = [[Int]](repeating: [], count: n)
//    for i in 0..<n {
//        result[i].append(left.queue[i])
//        result[i].append(contentsOf: middle.queue[i].queue)
//        result[i].append(right.queue[i])
//    }
//    return result
//}

print(solution([[1, 2, 3], [4, 5, 6], [7, 8, 9]], ["Rotate", "ShiftRow"]))
print(solution([[8, 6, 3], [3, 3, 7], [8, 4, 9]], ["Rotate", "ShiftRow", "ShiftRow"]))
print(solution([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]], ["ShiftRow", "Rotate", "ShiftRow", "Rotate"]))

print(solution([[1, 2], [3, 4]], ["Rotate"]))
