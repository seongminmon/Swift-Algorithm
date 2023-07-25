//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/05.
//
// 표 편집
// 2021 카카오 채용연계형 인턴십
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/81303

import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    class Node {
        var idx: Int
        var up: Node?
        var down: Node?

        init(idx: Int, up: Node?, down: Node?) {
            self.idx = idx
            self.up = up
            self.down = down
        }
    }

    var linkedList = [Node]()
    for i in 0..<n {
        linkedList.append(Node(idx: i, up: nil, down: nil))
    }

    linkedList[0].down = linkedList[1]
    for i in 1..<n-1 {
        linkedList[i].up = linkedList[i-1]
        linkedList[i].down = linkedList[i+1]
    }
    linkedList[n-1].up = linkedList[n-2]

    var cursor = linkedList[k]
    var deletes = [Node]()
    for i in 0..<cmd.count {
        let order = cmd[i].split(separator: " ")
        switch order[0] {
        case "U":
            let x = Int(order[1])!
            for _ in 0..<x {
                cursor = cursor.up!
            }
        case "D":
            let x = Int(order[1])!
            for _ in 0..<x {
                cursor = cursor.down!
            }
        case "C":
            deletes.append(cursor)
            cursor.up?.down = cursor.down
            cursor.down?.up = cursor.up
            cursor = cursor.down == nil ? cursor.up! : cursor.down!
        case "Z":
            let last = deletes.removeLast()
            last.up?.down = last
            last.down?.up = last
        default:
            break
        }
    }

    var result = [String](repeating: "O", count: n)
    for d in deletes { result[d.idx] = "X" }
    return result.joined()
}

print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))
print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]))
