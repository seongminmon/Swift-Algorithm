//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/09.
//
// 20055 : 컨베이어 벨트 위의 로봇
// https://www.acmicpc.net/problem/20055

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
var (n,k) = (nk[0], nk[1])
var belt = readLine()!.split(separator: " ").map { Int(String($0))! }

// 풀이
// 벨트 회전
func step1() {
    // 내구도 변화 없음
    // 1. 벨트 내구도 이동
    let a = belt.removeLast()
    belt.insert(a, at: 0)
    // 2. 로봇 한칸씩 이동
    let b = robot.removeLast()
    robot.insert(b, at:0)
    // 3. 로봇 즉시 내림
    if robot[n-1] {
        robot[n-1] = false
    }
}

// 로봇 이동
func step2() {
    // 역순으로 탐색
    for i in stride(from: n-2, through: 0, by: -1) {
        if robot[i], !robot[i+1], belt[i+1] > 0 {
            robot[i] = false
            robot[i+1] = true
            belt[i+1] -= 1
            if belt[i+1] == 0 {
                count0 += 1
            }
        }
    }
    // 로봇 즉시 내리기
    if robot[n-1] {
        robot[n-1] = false
    }
}

// 로봇 올리기
func step3() {
    if belt[0] > 0 {
        belt[0] -= 1
        if belt[0] == 0 {
            count0 += 1
        }
        robot[0] = true
    }
}

var robot = [Bool](repeating: false, count: n*2)
var count0 = 0
var result = 0
while count0 < k {
    result += 1
    step1()
    step2()
    step3()
}

// 출력
print(result)
