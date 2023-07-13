//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/07.
//
// 18405 : 경쟁적 전염
// https://www.acmicpc.net/problem/18405

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var graph = [[Int]](repeating: [], count: n+1)
for i in 1 ... n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[i] = [0] + input
}
let sxy = readLine()!.split(separator: " ").map { Int(String($0))! }
let (s,x,y) = (sxy[0], sxy[1], sxy[2])

// 풀이
// 초기 바이러스 좌표
var virus = [[(Int,Int)]](repeating: [], count: k+1)
for i in 1 ... n {
    for j in 1 ... n {
        virus[graph[i][j]].append((i,j))
    }
}

let da = [0,0,1,-1]
let db = [1,-1,0,0]
outerLoop: for _ in 0 ..< s {
    for i in 1 ... k {
        for (a,b) in virus[i] {
            for j in 0 ..< 4 {
                let na = a + da[j]
                let nb = b + db[j]
                if na > 0, na <= n, nb > 0, nb <= n {
                    if graph[na][nb] == 0 {
                        graph[na][nb] = i
                        virus[i].append((na,nb))
                    }
                    
                    // (x,y)가 채워지는 순간 변할 일이 없으므로 즉시 종료
                    if na == x, nb == y {
                        break outerLoop
                    }
                }
            }
        }
    }
}

// 출력
print(graph[x][y])
