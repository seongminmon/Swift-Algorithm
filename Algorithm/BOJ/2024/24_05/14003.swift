//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 5/8/24.
//
// 14003 : 가장 긴 증가하는 부분 수열 5
// https://www.acmicpc.net/problem/14003

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var lis: [Int] = [-Int.max]
var indexList: [Int] = []
for i in 0..<n {
    if lis.last! < arr[i] {
        // arr[i]가 lis의 마지막값보다 크다면 추가
        lis.append(arr[i])
        indexList.append(lis.count - 1)
    } else {
        // arr[i]가 lis의 마지막값 이하라면 lowerBound를 찾아서 대체
        var start = 0
        var end = lis.count - 1
        while start <= end {
            let mid = (start + end) / 2
            
            if lis[mid] < arr[i] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        lis[start] = arr[i]
        indexList.append(start)
    }
}

var length = indexList.max()!
print(length)

var ans = [Int]()
for i in stride(from: n-1, through: 0, by: -1) {
    if length == indexList[i] {
        ans.append(arr[i])
        length -= 1
    }
}
print(ans.reversed().map { String($0) }.joined(separator: " "))
