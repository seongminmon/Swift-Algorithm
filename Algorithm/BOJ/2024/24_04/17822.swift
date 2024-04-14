//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/11/24.
//
// 17822 : 원판 돌리기
// https://www.acmicpc.net/problem/17822

import Foundation

let nmt = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,t) = (nmt[0], nmt[1], nmt[2])

var arr = [[Int]](repeating: [], count: n+1)
for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr[i] = input
}

// x번째 원판을 회전시키는 함수
func rotate(_ x: Int, _ d: Int, _ k: Int) {
    let temp = arr[x] + arr[x] + arr[x]
    var s = m
    var e = 2 * m
    if d == 0 {
        // 시계 방향
        s -= k
        e -= k
    } else {
        // 반시계 방향
        s += k
        e += k
    }
    arr[x] = Array(temp[s..<e])
}

// 인접한 수들을 찾고 그 좌표들을 구하는 함수
func findSameNumbers() -> [(Int, Int)] {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n+1)
    for x in 1...n {
        for y in 0..<m {
            // 값이 없다면 패스
            if arr[x][y] == 0 { continue }
            
            // arr[i][j] => arr[i-1][j], arr[i+1][j], arr[i][j-1], arr[i][j+1]
            for d in 0..<4 {
                let nx = x + dx[d]
                var ny = y + dy[d]
                
                // ny 원형 처리
                if ny == -1 {
                    ny = m-1
                } else if ny == m {
                    ny = 0
                }
                
                if 1 <= nx, nx <= n, arr[nx][ny] != 0, arr[x][y] == arr[nx][ny] {
                    visited[x][y] = true
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    // 지워야 할 좌표들
    var ret = [(Int,Int)]()
    for i in 1...n {
        for j in 0..<m {
            if visited[i][j] {
                ret.append((i,j))
            }
        }
    }
    return ret
}

func calculate() {
    var sum = 0
    var cnt = 0
    for i in 1...n {
        for j in 0..<m {
            if arr[i][j] != 0 {
                sum += arr[i][j]
                cnt += 1
            }
        }
    }
    
    let average = Double(sum) / Double(cnt)
    for i in 1...n {
        for j in 0..<m {
            if arr[i][j] == 0 {
                continue
            } else if Double(arr[i][j]) > average {
                arr[i][j] -= 1
            } else if Double(arr[i][j]) < average {
                arr[i][j] += 1
            }
        }
    }
}

for _ in 0..<t {
    let xdk = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x,d,k) = (xdk[0], xdk[1], xdk[2])
    
    // 1. 번호가 x의 배수인 원판을 d방향으로 k칸 회전
    for i in stride(from: x, through: n, by: x) {
        rotate(i, d, k)
    }
    
    // 2. 원판에 수가 남아있으면, 인접하면서 수가 같은 것을 모두 찾는다
    let deleteList = findSameNumbers()
    
    if !deleteList.isEmpty {
        // (1) 그러한 수가 있다면 모두 지운다
        for (x, y) in deleteList {
            arr[x][y] = 0
        }
    } else {
        // (2) 없을 경우 원판에 적힌 수의 평균을 구하고,
        //     평균보다 큰 수는 -1, 작은 수는 +1, 평균인 수는 그대로
        calculate()
    }
}

var ans = 0
for i in 1...n {
    for j in 0..<m {
        ans += arr[i][j]
    }
}
print(ans)
