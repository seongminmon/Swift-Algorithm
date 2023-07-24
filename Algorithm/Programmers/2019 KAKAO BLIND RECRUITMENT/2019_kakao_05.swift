//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/23.
//
// 길 찾기 게임
// 2019 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42892

import Foundation

class Node {
    var id: Int
    var x: Int
    var y: Int
    var left: Node?
    var right: Node?
    
    init(id: Int, x: Int, y: Int) {
        self.id = id
        self.x = x
        self.y = y
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    let n = nodeinfo.count
    var nodes = [Node]()
    for i in 0..<n {
        let node = Node(id: i+1, x: nodeinfo[i][0], y: nodeinfo[i][1])
        nodes.append(node)
    }
    nodes.sort { $0.y > $1.y }
    
    func addNode(_ parent: Node, _ child: Node) {
        if child.x < parent.x {
            if parent.left == nil {
                parent.left = child
            } else {
                addNode(parent.left!, child)
            }
        } else {
            if parent.right == nil {
                parent.right = child
            } else {
                addNode(parent.right!, child)
            }
        }
    }
    
    let root = nodes[0]
    for i in 1..<n {
        addNode(root, nodes[i])
    }
    
    var pre = [Int]()
    var post = [Int]()
    func preorder(_ node: Node?) {
        guard let node = node else { return }
        pre.append(node.id)
        preorder(node.left)
        preorder(node.right)
    }
    func postorder(_ node: Node?) {
        guard let node = node else { return }
        postorder(node.left)
        postorder(node.right)
        post.append(node.id)
    }
    preorder(root)
    postorder(root)
    return [pre, post]
}

print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))
