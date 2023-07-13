//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/15.
//
// 21609 : 상어 중학교
// https://www.acmicpc.net/problem/21609

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
// 하나의 그룹 만들기
func makeGroup(_ arr: [[Int]], _ x: Int, _ y: Int) -> [(Int,Int)] {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    let target = graph[x][y]
    var queue = [(x,y)]
    var idx = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    visited[x][y] = true
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n, !visited[nx][ny] {
                if graph[nx][ny] == 0 || graph[nx][ny] == target {
                    queue.append((nx,ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    return queue
}

// 중력 작용
func gravity(_ arr: [[Int]]) -> [[Int]] {
    var graph = arr
    
    for i in 0 ..< n {
        for j in stride(from: n-2, through: 0, by: -1) {
            if graph[j][i] < 0 {
                continue
            }
            
            for k in j ..< n-1 {
                if graph[k+1][i] == -2 {
                    let temp = graph[k][i]
                    graph[k][i] = graph[k+1][i]
                    graph[k+1][i] = temp
                } else {
                    break
                }
            }
        }
    }
    
    return graph
}

// 90도 반시계 회전
func rotate90(_ arr: [[Int]]) -> [[Int]] {
    var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    
    for i in 0 ..< n {
        for j in 0 ..< n {
            graph[n-j-1][i] = arr[i][j]
        }
    }
    
    return graph
}

struct Group {
    var group: [(Int,Int)]
    var totalCnt: Int
    var zeroCnt: Int
    var standardX: Int
    var standardY: Int
}

var result = 0
while true {
    var groups = [Group]()
    
    // 그룹 만들기
    for i in 0 ..< n {
        for j in 0 ..< n {
            if graph[i][j] > 0 {
                var group = makeGroup(graph, i, j)
                
                if group.count >= 2 {
                    // 무지개 블록 수
                    var zeroCnt = 0
                    for (x,y) in group {
                        if graph[x][y] == 0 {
                            zeroCnt += 1
                        }
                    }
                    
                    // 기준 블록 찾기
                    group.sort{ (a,b) -> Bool in
                        if a.0 == b.0 {
                            return a.1 < b.1
                        } else {
                            return a.0 < b.0
                        }
                    }
                    
                    var standardX = 0
                    var standardY = 0
                    for (x,y) in group {
                        if graph[x][y] != 0 {
                            standardX = x
                            standardY = y
                            break
                        }
                    }
                    
                    // 그룹 추가
                    groups.append(Group(group: group, totalCnt: group.count, zeroCnt: zeroCnt, standardX: standardX, standardY: standardY))
                }
            }
        }
    }
    
    // 종료 조건
    if groups.isEmpty {
        break
    }
    
    // 그룹들 우선 순위대로 정렬
    groups.sort{ (a,b) -> Bool in
        if a.totalCnt == b.totalCnt {
            if a.zeroCnt == b.zeroCnt {
                if a.standardX == b.standardX {
                    return a.standardY > b.standardY
                } else {
                    return a.standardX > b.standardX
                }
            } else {
                return a.zeroCnt > b.zeroCnt
            }
        } else {
            return a.totalCnt > b.totalCnt
        }
    }
    
    // 블록 제거 (제거된 칸: -2)
    let selectedGroup = groups.first!.group
    for (x,y) in selectedGroup {
        graph[x][y] = -2
    }
    // 점수 획득
    result += selectedGroup.count * selectedGroup.count
    
    // 중력 작용 + 회전 + 중력 작용
    graph = gravity(graph)
    graph = rotate90(graph)
    graph = gravity(graph)
}

// 출력
print(result)
