//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/10.
//
// 17140 : 이차원 배열과 연산
// https://www.acmicpc.net/problem/17140

import Foundation

// 입력
let rck = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (r,c,k) = (rck[0], rck[1], rck[2])
var A = [[Int]]()
for _ in 0 ..< 3 {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    A.append(input)
}

// 풀이
func sortOneLine(_ arr: [Int]) -> [Int] {
    // (숫자, 등장 횟수)
    var cntList = [(Int,Int)](repeating: (0,0), count: arr.max()! + 1)
    for i in 0 ..< cntList.count { cntList[i].0 = i }
    for i in 0 ..< arr.count {
        cntList[arr[i]].1 += 1
    }
    
    // 등장 횟수 순으로 정렬
    cntList.sort{ $0.1 < $1.1 }
    //    cntList.sort{ $0.0 < $1.0 }
    
    var arr = [Int]()
    for i in 0 ..< cntList.count {
        if cntList[i].1 > 0, cntList[i].0 != 0 {
            arr.append(cntList[i].0)
            arr.append(cntList[i].1)
        }
    }
    
    return arr
}

var arr = A
var result = 0
for _ in 0 ... 100 {
    // 종료 조건
    if r-1 < arr.count, c-1 < arr[0].count {
        if arr[r-1][c-1] == k {
            break
        }
    }
    
    // R연산 또는 C연산 진행
    var nextArr = [[Int]]()
    // 행 개수 >= 열 개수
    if arr.count >= arr[0].count {
        // R 연산 : 모든 행 정렬
        var MAX = 0
        for i in 0 ..< arr.count {
            let sortOne = sortOneLine(arr[i])
            nextArr.append(sortOne)
            MAX = max(MAX, sortOne.count)
        }
        if MAX > 100 { MAX = 100 }
        
        for i in 0 ..< nextArr.count {
            // 100 넘으면 자르기
            while nextArr[i].count > 100 {
                nextArr[i].removeLast()
            }
            // 0 채우기
            while nextArr[i].count < MAX {
                nextArr[i].append(0)
            }
        }
    } else {
        // C 연산 : 모든 열 정렬
        var tempNextArr = [[Int]]()
        var MAX = 0
        for i in 0 ..< arr[0].count {
            var tempArr = [Int]()
            for j in 0 ..< arr.count {
                tempArr.append(arr[j][i])
            }
            
            let sortOne = sortOneLine(tempArr)
            tempNextArr.append(sortOne)
            MAX = max(MAX, sortOne.count)
        }
        if MAX > 100 { MAX = 100 }
        
        for i in 0 ..< tempNextArr.count {
            // 100 넘으면 자르기
            while tempNextArr[i].count > 100 {
                tempNextArr[i].removeLast()
            }
            // 0 채우기
            while tempNextArr[i].count < MAX {
                tempNextArr[i].append(0)
            }
        }
        
        // 열 -> 행으로 바꾸기
        nextArr = [[Int]](repeating: [], count: tempNextArr[0].count)
        for i in 0 ..< tempNextArr.count {
            for j in 0 ..< tempNextArr[0].count {
                nextArr[j].append(tempNextArr[i][j])
            }
        }
    }
    
    arr = nextArr
    
    // 연산 횟수 + 1
    result += 1
}

// 출력
if result == 101 {
    print(-1)
} else {
    print(result)
}
