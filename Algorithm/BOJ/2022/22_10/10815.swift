//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/20.
//
// 10815 : 숫자 카드
// https://www.acmicpc.net/problem/10815

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
let m = Int(readLine()!)!
var targetArr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
arr.sort()

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = n-1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if arr[mid] < target {
            start = mid + 1
        } else if arr[mid] > target {
            end = mid - 1
        } else {
            return 1
        }
    }
    
    return 0
}

var result = [Int]()
for target in targetArr {
    result.append(binarySearch(arr, target))
}

// 출력
print( result.map{ String($0) }.joined(separator: " ") )
