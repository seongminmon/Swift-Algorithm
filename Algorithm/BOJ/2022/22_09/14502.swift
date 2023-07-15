//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/29.
//
// 14502 : 연구소
// https://www.acmicpc.net/problem/14502

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n,m) = (nm[0], nm[1])

var arr = [[Int]]()
for _ in 0 ..< n {
    let input =  readLine()!.split(separator: " ").map {Int(String($0))!}
    arr.append(input)
}

// 풀이
var safeZone = [(Int,Int)]()
var virusZone = [(Int,Int)]()
for i in 0 ..< n {
    for j in 0 ..< m {
        if arr[i][j] == 0 {
            safeZone.append((i,j))
        }
        if arr[i][j] == 2 {
            virusZone.append((i,j))
        }
    }
}

func infection(_ arr: [[Int]]) -> [[Int]] {
    var tempArr = arr
    var queue = virusZone
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    while !queue.isEmpty {
        let (x,y) = queue.removeFirst()
        for i in 0 ..< 4 {
            let tempX = x + dx[i]
            let tempY = y + dy[i]
            if tempX >= 0 && tempX < n && tempY >= 0 && tempY < m {
                if tempArr[tempX][tempY] == 0 {
                    tempArr[tempX][tempY] = 2
                    queue.append((tempX,tempY))
                }
            }
        }
    }
    
    return tempArr
}

func countZero(_ arr: [[Int]]) -> Int {
    var cnt = 0
    for i in 0 ..< n {
        for j in 0 ..< m {
            if arr[i][j] == 0 {
                cnt += 1
            }
        }
    }
    return cnt
}

var result = 0
for k in 0 ..< safeZone.count {
    for i in k+1 ..< safeZone.count {
        for j in i+1 ..< safeZone.count {
            var tempArr = arr
            let wall1 = safeZone[k]
            let wall2 = safeZone[i]
            let wall3 = safeZone[j]
            tempArr[wall1.0][wall1.1] = 1
            tempArr[wall2.0][wall2.1] = 1
            tempArr[wall3.0][wall3.1] = 1
            
            let inspectedArr = infection(tempArr)
            let cnt = countZero(inspectedArr)
            if result < cnt {
                result = cnt
            }
        }
    }
}

// 출력
print(result)
