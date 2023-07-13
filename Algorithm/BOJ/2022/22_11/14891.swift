//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/13.
//
// 14891 : 톱니바퀴
// https://www.acmicpc.net/problem/14891

import Foundation

// 입력
var gears = [[Int]]()
for _ in 0 ..< 4 {
    let gear = readLine()!.map{ Int(String($0))! }
    gears.append(gear)
}

let k = Int(readLine()!)!
var plans = [(Int,Int)]()   // (번호, 방향)
for _ in 0 ..< k {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    plans.append((input[0] - 1, input[1]))
}

// 풀이
for (gearNum, direction) in plans {
    // (회전 여부, 방향)
    var visited = [(Bool, Int)](repeating: (false, 0), count: 4)
    visited[gearNum] = (true, direction)
    
    // 오른쪽 확인
    for i in gearNum ..< 3 {
        if gears[i][2] != gears[i+1][6] {
            visited[i+1] = (true, (visited[i].1 == 1 ? -1 : 1))
        } else {
            break
        }
    }
    
    // 왼쪽 확인
    for i in stride(from: gearNum, to: 0, by: -1) {
        if gears[i-1][2] != gears[i][6] {
            visited[i-1] = (true, (visited[i].1 == 1 ? -1 : 1))
        } else {
            break
        }
    }
    
    // 회전
    for i in 0 ..< 4 {
        if visited[i].0 {
            gears[i] = rotation(gears[i], visited[i].1)
        }
    }
}

func rotation(_ arr: [Int], _ direction: Int) -> [Int] {
    var gear = arr
    
    // 시계 방향
    if direction == 1 {
        let temp = gear.removeLast()
        gear.insert(temp, at: 0)
    } else {
    // 반시계 방향
        let temp = gear.removeFirst()
        gear.append(temp)
    }
    
    return gear
}

// 출력
var result = 0
for i in 0 ..< 4 {
    result += gears[i][0] == 0 ? 0 : Int(pow(2.0, Double(i)))
}
print(result)
