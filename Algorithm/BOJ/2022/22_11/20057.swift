//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/17.
//
// 20057 : 마법사 상어와 토네이도
// https://www.acmicpc.net/problem/20057

import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
var tornado = (n/2, n/2)
var tDirection = 0

// 좌, 하, 우, 상
let tdx = [0, 1, 0, -1]
let tdy = [-1, 0, 1, 0]

// 방향 전환
var turn = [Bool](repeating: false, count: n*n)
var jump = 1
var cnt = 0
var i = 0
while i < n*n {
    turn[i] = true
    i += jump
    if cnt % 2 == 0 {
        jump += 1
    }
    cnt += 1
}

var result = 0
// 토네이도의 이동 횟수는 n*n - 1
for i in 0 ..< n*n - 1 {
    // 토네이도 이동
    tornado.0 += tdx[tDirection]
    tornado.1 += tdy[tDirection]
    
    // 분배할 위치
    var dx = [0]
    var dy = [0]
    switch tDirection {
    case 0 : // 좌
        dx = [-1, 1, -2, 2, -1, 1, -1, 1, 0, 0]
        dy = [0, 0, 0, 0, -1, -1, 1, 1, -2, -1]
    case 1 : // 하
        dx = [0, 0, 0, 0, 1, 1, -1, -1, 2, 1]
        dy = [-1, 1, -2, 2, -1, 1, -1, 1, 0, 0]
    case 2 : // 우
        dx = [1, -1, 2, -2, 1, -1, 1, -1, 0, 0]
        dy = [0, 0, 0, 0, 1, 1, -1, -1, 2, 1]
    default : // 상
        dx = [0, 0, 0, 0, -1, -1, 1, 1, -2, -1]
        dy = [1, -1, 2, -2, -1, 1, -1, 1, 0, 0]
    }
    
    // y좌표
    let x = tornado.0
    let y = tornado.1
    let total = graph[x][y]
    
    // y값이 0이 아니면 분배
    if total > 0 {
        var sum = 0
        
        for d in 0 ... 8 {
            var value = 0
            switch d {
            case 0,1: value = total * 7 / 100
            case 2,3: value = total * 2 / 100
            case 4,5: value = total / 10
            case 6,7: value = total / 100
            default: value = total * 5 / 100
            }
            sum += value
            
            let nx = x + dx[d]
            let ny = y + dy[d]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n {
                graph[nx][ny] += value
            } else {
                result += value
            }
        }
        
        // 알파
        let nx = x + dx.last!
        let ny = y + dy.last!
        
        if 0 <= nx, nx < n, 0 <= ny, ny < n {
            graph[nx][ny] += total - sum
        } else {
            result += total - sum
        }
        
        // y 비우기
        graph[x][y] = 0
    }
    
    // 방향 전환
    if turn[i] {
        tDirection  = (tDirection + 1) % 4
    }
    
}

// 출력
print(result)
