//
//  asdf.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/19.
//
// 1753 : 최단경로
// https://www.acmicpc.net/problem/1753

import Foundation

// 힙을 통한 우선순위 큐 구현
struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    // 삽입 : O(logn)
    mutating func insert(_ element: T) {
        // 1. 맨 끝에 추가
        nodes.append(element)
        
        // 2. 부모와 비교하면서 힙 구조 조건 만족 시킴 (루트까지)
        var index = nodes.count - 1
        while index > 0 && !comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1) / 2
        }
    }
    
    // 삭제 : O(logn)
    mutating func delete() -> T? {
        // 길이가 0과 1일때 예외처리
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeFirst() }
        
        // 1. 루트와 맨 끝 교환, 맨끝 삭제 후 리턴
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        nodes.removeLast()
        
        // 2. 자식과 비교하며 힙 구조 조건 만족 시킴 (맨끝까지)
        var index = 0
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            
            // (1) 오른쪽 노드가 존재하는 경우 (자식이 둘인 경우)
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]) &&
                    !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
              // (2) 왼쪽 노드만 존재하는 경우 (자식이 하나인 경우)
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
              // (3) 완전 이진 트리라서 오른쪽 노드만 존재하는 경우는 없음
            } else {
                break
            }
        }
        
        // 1. 맨끝 리턴하는 부분
        return result
    }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let m = input[1]
var start = Int(readLine()!)!
let INF = Int(1e9)

var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 1 ... m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]].append((input[1],input[2]))
}

// 거리 배열 무한으로 초기화
var dist = [Int](repeating: INF, count: n+1)
// 시작점은 0
dist[start] = 0

var heap: Heap<(Int,Int)> = Heap { $0.1 > $1.1 }  // Min Heap 생성
//var heap: Heap<Int> = Heap { $0 < $1 }  // Max Heap 생성

heap.insert((start,0))
while !heap.isEmpty {
    // 힙에서 현재 고려할 노드 빼옴
    let now = heap.delete()!
    
    // 기존 거리 배열에 있는 거리보다 크면 고려 x
    if dist[now.0] < now.1 {
        continue
    }
    
    // 거리 배열 갱신 + 힙에 넣기
    for i in graph[now.0] {
        // 기존 거리보다 갱신하는게 더 짧을 때만
        if now.1 + i.1 < dist[i.0] {
            dist[i.0] = now.1 + i.1
            heap.insert((i.0, now.1 + i.1))
        }
    }
}

// 답 출력
for i in 1 ... n {
    if dist[i] == INF {
        print("INF")
    } else {
        print(dist[i])
    }
}
