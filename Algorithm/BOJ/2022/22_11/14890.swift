//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/10.
//
// 14890 : 경사로
// https://www.acmicpc.net/problem/14890

import Foundation

// 입력
let nl = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,l) = (nl[0], nl[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
var result = 0
for i in 0 ..< n {
    // 행 (n개) 체크
    if checkRoad(graph[i]) {
        result += 1
    }
    
    // 열 (n개) 체크
    var tempRoad = [Int]()
    for j in 0 ..< n {
        tempRoad.append(graph[j][i])
    }
    if checkRoad(tempRoad) {
        result += 1
    }
}

func checkRoad(_ road: [Int]) -> Bool {
    var visited = [Bool](repeating: false, count: n)
    
    for i in 0 ..< n - 1 {
        if abs(road[i] - road[i+1]) > 1 {
            return false
        }
        
        if road[i] < road[i+1] {
            // '/' 모양 경사로 설치
            if i - l + 1 >= 0 {
                for j in stride(from: i, through: i - l + 1, by: -1) {
                    if road[i] != road[j] || visited[j] {
                        return false
                    } else {
                        visited[j] = true
                    }
                }
            } else {
                return false
            }
        } else if road[i] > road[i+1] {
            // '\' 모양 경사로 설치
            if i + l < n {
                for j in i + 1 ... i + l {
                    if road[i+1] != road[j] || visited[j] {
                        return false
                    } else {
                        visited[j] = true
                    }
                }
            } else {
                return false
            }
        }
        
    }
    
    return true
}

// 출력
print(result)
