//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 10866 : 덱
// https://www.acmicpc.net/problem/10866

import Foundation

// 입력
let n = Int(readLine()!)!
var orders = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    orders.append(input)
}

// 풀이 + 출력
var deque = [Int]()
for str in orders {
    switch str[0] {
    case "push_front":
        deque.insert(Int(str[1])!, at: 0)
    case "push_back":
        deque.append(Int(str[1])!)
    case "pop_front":
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.removeFirst())
        }
    case "pop_back":
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.removeLast())
        }
    case "size": print(deque.count)
    case "empty": print( deque.isEmpty ? 1 : 0 )
    case "front":
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.first!)
        }
    case "back":
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.last!)
        }
    default: break
    }
}
