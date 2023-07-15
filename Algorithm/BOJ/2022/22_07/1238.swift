//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/23.
//
// 1238 : 파티
// https://www.acmicpc.net/problem/1238

// 풀이 1: 다익스트라
import Foundation

struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T,T) -> Bool

    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    mutating func insert(_ element: T) {
        // 1. 맨 끝에 인덱스 추가
        var index = nodes.count
        nodes.append(element)

        // 부모와 비교하며 힙 조건 만족시킴
        while index > 0 , !comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func delete() -> T? {
        // 배열 크기 0과 1일 때 예외 처리
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        // <1> 루트 반환, 루트와 맨끝노드 바꾸고, 맨끝노드 삭제
        let result = nodes.first!
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()

        // <2> 루트와 자식들 비교하며 힙 조건 만족시킴
        var index = 0
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            // 1. 오른쪽 자식이 있는 경우 (자식이 둘인 경우)
            if right < nodes.count {
                // (1) 오른쪽 자식과 바꿔야 하는 경우
                if comparer(nodes[left], nodes[right]) , !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                // (2) 왼쪽 자식과 바꿔야 하는 경우
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                // (3) 안 바꿔야 하는 경우
                } else {
                    break
                }
            // 2. 왼쪽 자식만 있는 경우 (자식이 하나인 경우)
            } else if left < nodes.count {
                // (1) 바꿔야 하는 경우
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                // (2) 안 바꿔야 하는 경우
                } else {
                    break
                }
            // 3. 자식이 없는 경우
            } else {
                break
            }
        }

        return result
    }
}

struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool {
        lhs.cost < rhs.cost
    }
    var cost: Int
    var node: Int
}

let nmx = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,x) = (nmx[0], nmx[1], nmx[2])
var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0 ..< m {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,c) = (abc[0], abc[1], abc[2])
    graph[a].append((b,c))
}

let INF = Int(1e9)
func dijkstra(_ start: Int) -> [Int] {
    var dist = [Int](repeating: INF, count: n+1)
    dist[start] = 0

    var minHeap =  Heap<Data>(){ $0.cost > $1.cost }
    minHeap.insert(Data(cost: 0, node: start))

    while !minHeap.isEmpty {
        let now = minHeap.delete()!

        if dist[now.node] < now.cost {
            continue
        }

        for nextNode in graph[now.node] {
            let cost = dist[now.node] + nextNode.1
            if cost < dist[nextNode.0] {
                dist[nextNode.0] = cost
                minHeap.insert(Data(cost: cost, node: nextNode.0))
            }
        }
    }

    return dist
}

var ans = dijkstra(x)
var Max = 0
for i in 1 ... n {
    ans[i] += dijkstra(i)[x]
    Max = max(Max, ans[i])
}
print(Max)


// 풀이 2: 플로이드-워셜
//import Foundation
//
//let nmx = readLine()!.split(separator: " ").map{Int(String($0))!}
//let (n,m,x) = (nmx[0],nmx[1],nmx[2])
//
//var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
//for _ in 0..<m {
//    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
//    graph[abc[0]][abc[1]] = abc[2]
//}
//
//for k in 1...n {
//    for a in 1...n {
//        if graph[a][k] == 0 { continue }
//        for b in 1...n {
//            if a == b || graph[k][b] == 0 { continue }
//            if graph[a][b] == 0 || graph[a][b] > graph[a][k] + graph[k][b] {
//                graph[a][b] = graph[a][k] + graph[k][b]
//            }
//        }
//    }
//}
//
//var ans = 0
//for i in 1...n { ans = max(ans, graph[i][x] + graph[x][i]) }
//print(ans)
