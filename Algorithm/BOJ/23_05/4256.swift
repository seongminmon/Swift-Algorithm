//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/23.
//
// 4256 : 트리
// https://www.acmicpc.net/problem/4256

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    _ = Int(readLine()!)!
    let preOrder = readLine()!.split(separator: " ").map { Int(String($0))! }
    let inOrder = readLine()!.split(separator: " ").map { Int(String($0))! }

    var postOrder = [Int]()
    func solve(_ preOrder: [Int], _ inOrder: [Int]) {
        if preOrder.isEmpty { return }

        let root = preOrder.first!
        let rootIdx: Int = inOrder.firstIndex(of: root)!

        let leftInOrder = Array(inOrder[..<rootIdx])
        let rightInOrder = Array(inOrder[(rootIdx+1)...])

        var leftPreOrder: [Int] = []
        if rootIdx > 0 {
            leftPreOrder = Array(preOrder[1...rootIdx])
        }
        let rightPreOrder = Array(preOrder[(rootIdx+1)...])

        solve(leftPreOrder, leftInOrder)
        solve(rightPreOrder, rightInOrder)
        postOrder.append(root)
    }

    solve(preOrder, inOrder)

    print(postOrder.map { String($0) }.joined(separator: " "))
}
