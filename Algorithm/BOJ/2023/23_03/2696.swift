//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/26.
//
// 2696 : 중앙값 구하기
// https://www.acmicpc.net/problem/2696

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    let m = Int(readLine()!)!
    var arr = [Int]()
    
    if m <= 10 {
        arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    } else {
        var lines = m / 10
        if m % 10 != 0 { lines += 1 }
        
        for _ in 0 ..< lines {
            arr += readLine()!.split(separator: " ").map{ Int(String($0))! }
        }
    }
    
    var middleArr = [Int]()
    var tempArr = [Int]()
    for i in 0 ..< m {
        tempArr.append(arr[i])
        if i % 2 == 0 {
            tempArr.sort()
            middleArr.append(tempArr[(i+1) / 2])
        }
    }
    
    print(middleArr.count)
    var result = ""
    for i in 0 ..< middleArr.count {
        if i != 0, i % 10 == 0 {
            result += "\n"
        }
        result += "\(middleArr[i]) "
    }
    print(result)
}
