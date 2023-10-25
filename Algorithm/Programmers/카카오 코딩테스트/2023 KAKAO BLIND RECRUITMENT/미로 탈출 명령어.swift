//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/28.
//
// 미로 탈출 명령어
// 2023 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/150365

import Foundation

// 풀이 1
func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    let dir = ["d", "l", "r", "u"]
    let dx = [1, 0, 0, -1]
    let dy = [0, -1, 1, 0]

    var result = "impossible"
    func dfs(_ x: Int, _ y: Int, _ route: String) {
        // 조기 탈출
        // (1) 이미 답을 찾은 경우
        if result != "impossible" {
            return
        }
        
        let distance = abs(x-r) + abs(y-c)
        let remain = k - route.count
        
        // (2) 현재 거리가 남은 이동횟수 보다 큰 경우
        if distance > remain {
            return
        }
        
        // (3) (남은 이동횟수 - 현재 거리)가 홀수 일때
        if (remain - distance) % 2 == 1 {
            return
        }
        
        // 종료 조건
        if route.count == k && (x,y) == (r,c) {
            result = route
            return
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 1 <= nx, nx <= n, 1 <= ny, ny <= m {
                dfs(nx, ny, route + dir[i])
            }
        }
    }
    
    dfs(x, y, "")
    
    return result
}

// 풀이 2
//func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
//    let dir = ["d", "l", "r", "u"]
//    let dx = [1, 0, 0, -1]
//    let dy = [0, -1, 1, 0]
//
//    var x = x
//    var y = y
//    var result = ""
//    for i in 0..<k {
//        for j in 0..<4 {
//            let nx = x + dx[j]
//            let ny = y + dy[j]
//            let distance = abs(nx-r) + abs(ny-c)
//
//            if 1 <= nx, nx <= n, 1 <= ny, ny <= m, distance < k - i {
//                result += dir[j]
//                x = nx
//                y = ny
//                break
//            }
//        }
//    }
//
//    return result.count == k ? result : "impossible"
//}

print(solution(3, 4, 2, 3, 3, 1, 5))
print(solution(2, 2, 1, 1, 2, 2, 2))
print(solution(3, 3, 1, 2, 3, 3, 4))
