//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/14.
//
// 21608 : 상어 초등학교
// https://www.acmicpc.net/problem/21608

import Foundation

// 입력
let n = Int(readLine()!)!
var students = [Int]()
// 인덱스: 학생 번호
var likeStudents = [[Int]](repeating: [], count: n*n + 1)
for _ in 0 ..< n*n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    students.append(input[0])
    likeStudents[input[0]] = input
    likeStudents[input[0]].removeFirst()
}

// 풀이
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

struct square {
    var x: Int
    var y: Int
    var cnt: Int = 0
    var likeCnt: Int = 0
}

var queue = [square]()
for i in 0 ..< n {
    for j in 0 ..< n {
        queue.append(square(x: i, y: j))
    }
}

for i in 0 ..< students.count {
    // 현재 고려하는 학생
    let student = students[i]
    // 그 학생이 좋아하는 4명의 학생들
    let likeStudent = likeStudents[student]
    
    // 1, 2, 3
    for j in 0 ..< queue.count {
        // 큐 초기화
        queue[j].cnt = 0
        queue[j].likeCnt = 0
        
        for d in 0 ..< 4 {
            let nx = queue[j].x + dx[d]
            let ny = queue[j].y + dy[d]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n {
                // 빈칸 수 추가
                if graph[nx][ny] == 0 {
                    queue[j].cnt += 1
                // 좋아하는 학생 수 추가
                } else if likeStudent.contains(graph[nx][ny]) {
                    queue[j].likeCnt += 1
                }
            }
        }
    }
    
    // 기준들에 따라서 정렬
    queue.sort{ (a,b) -> Bool in
        if a.likeCnt == b.likeCnt {
            if a.cnt == b.cnt {
                if a.x == b.x {
                    return a.y < b.y
                } else {
                    return a.x < b.x
                }
            } else {
                return a.cnt > b.cnt
            }
        } else {
            return a.likeCnt > b.likeCnt
        }
    }
    
    // 제일 우선 순위 높은 곳에 학생 배치, 큐에서 삭제
    graph[queue[0].x][queue[0].y] = student
    queue.removeFirst()
}

// 출력
var result = 0
for i in 0 ..< n {
    for j in 0 ..< n {
        var cnt = 0
        
        for d in 0 ..< 4 {
            let nx = i + dx[d]
            let ny = j + dy[d]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n {
                if likeStudents[graph[i][j]].contains(graph[nx][ny]) {
                    cnt += 1
                }
            }
        }
        
        switch cnt {
        case 1: result += 1
        case 2: result += 10
        case 3: result += 100
        case 4: result += 1000
        default: break
        }
        
    }
}
print(result)
