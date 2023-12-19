//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/10.
//
// 14890 : 경사로
// https://www.acmicpc.net/problem/14890

import Foundation

let nl = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,l) = (nl[0], nl[1])

var garo = [[Int]]()
var sero = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    garo.append(input)
    for j in 0..<n {
        sero[j][i] = input[j]
    }
}

var ans = 0
func isPossible(_ arr: [Int]) -> Bool {
    var visited = [Bool](repeating: false, count: n)
    var cnt = 1
    for i in 1..<n {
        if abs(arr[i-1] - arr[i]) > 1 {
            return false
        }
        
        // 높이차가 2 이상나면 불가능
        if arr[i-1] == arr[i] {
            cnt += 1
        } else if arr[i-1] < arr[i] {
            // 평지가 부족하면 불가능
            if cnt < l {
                return false
            }
            
            // 오르막 경사로 설치
            for j in (i-l)..<i {
                // 이미 설치되어있다면 불가능
                if visited[j] {
                    return false
                }
                visited[j] = true
            }
            
            // 카운트 초기화
            cnt = 1
        }
    }
    
    cnt = 1
    for i in stride(from: n-2, through: 0, by: -1) {
        // 높이차가 2 이상나면 불가능
        if abs(arr[i] - arr[i+1]) > 1 {
            return false
        }
        
        if arr[i] == arr[i+1] {
            cnt += 1
        } else if arr[i] > arr[i+1] {
            // 평지가 부족하면 불가능
            if cnt < l {
                return false
            }
            
            // 오르막 경사로 설치
            for j in (i+1)...(i+l) {
                // 이미 설치되어있다면 불가능
                if visited[j] {
                    return false
                }
                visited[j] = true
            }
            
            // 카운트 초기화
            cnt = 1
        }
    }
    
    return true
}

for i in garo {
    if isPossible(i) {
        ans += 1
    }
}

for j in sero {
    if isPossible(j) {
        ans += 1
    }
}

print(ans)
