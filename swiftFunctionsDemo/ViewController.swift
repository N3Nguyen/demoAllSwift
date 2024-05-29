//
//  ViewController.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 17/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //the hien su khac nhau giua tac vu bat dong bo và dong bo
        //        fetchDataSync()
        //        fetchDataAsync()
        
        //The hien tac bu bat dong bo va dispatchGroup
        //        concurentQueue()
        //        demoDispatchGroup()
        
        //
        doBackgroundWork()
        updateUI()
        //        let result = fetchDataSync()
        //        Thread.sleep(forTimeInterval:2)
        //        print(result)
        
        print("Tiếp tục với công việc khác")
    }
    
    func ThreadSwift() {
        let queue = DispatchQueue(label: "myQueue")
        queue.async {
            self.requestSomthing()
        }
        
        DispatchQueue.main.async {
            self.view.backgroundColor = .red
        }
    }
    
    func demoDispatchGroup1() {
        let queue = DispatchQueue.global()
        
        group.enter()
        queue.async {
            // Công việc 1
            print("Task 1 started")
            sleep(2) // Giả lập công việc mất 2 giây
            print("Task 1 completed")
            group.leave()
        }
        
        group.enter()
        queue.async {
            // Công việc 2
            print("Task 2 started")
            sleep(1) // Giả lập công việc mất 1 giây
            print("Task 2 completed")
            group.leave()
        }
    }
    
    func demoDispatchGroup2() {
        let queue = DispatchQueue.global()

        queue.async(group: group) {
            // Công việc 1
            print("Task 1 started")
            sleep(2)
            print("Task 1 completed")
        }

        queue.async(group: group) {
            // Công việc 2
            print("Task 2 started")
            sleep(1)
            print("Task 2 completed")
        }
    }
    
    func requestSomthing() {
        
    }
    
    func fetchDataSync() {
        // tác vụ đồng bộ
        Thread.sleep(forTimeInterval: 2) // Dừng lại trong 2 giây
        print("\(self.love()) fetchDataSyns")
        print("Current thread: \(Thread.current)")
    }
    
    func fetchDataAsync() {
        DispatchQueue.global(qos: .default).async {
            // tác vụ bất đồng bộ
            Thread.sleep(forTimeInterval: 5) // Dừng lại trong 2 giây
            print("\(self.smile()) fetchDataAsync")
            print("Current thread: \(Thread.current)")
        }
    }
    
    func smile(){
        print("*-_-*")
    }
    func love(){
        print("<3")
    }
    
    func concurentQueue(){
        let queue = DispatchQueue(label: "hóng ConcurrentQueue", qos: .default, attributes: .concurrent)
        queue.async {
            for _ in 1...5 {
                Thread.sleep(forTimeInterval: 1)
                self.smile()
            }
        }
        
        queue.async {
            for _ in 1...5 {
                Thread.sleep(forTimeInterval: 1)
                self.love()
            }
        }
        print("Current thread: \(Thread.current)")
    }
    
    func doBackgroundWork() {
        DispatchQueue.global(qos: .background).async {
            print("Background thread: \(Thread.current)")
            if Thread.isMainThread {
                print("Running on the main thread")
            } else {
                print("Running on a background thread")
            }
            
            // Đặt breakpoint ở dòng dưới để kiểm tra luồng
            let _ = 1 + 1
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            print("Main thread: \(Thread.current)")
            if Thread.isMainThread {
                print("Running on the main thread")
            } else {
                print("Running on a background thread")
            }
            
            // Đặt breakpoint ở dòng dưới để kiểm tra luồng
            let _ = 2 + 2
        }
    }
    
    func qosDispathQueue() {
        let queue1 = DispatchQueue(label: "qos userInitiated", qos: .userInitiated)
        let queue2 = DispatchQueue(label: "qos utility", qos: .utility)
        queue1.async {
            for i in 0..<10 {
                print("🔴", i)
            }
        }
        queue2.async {
            for i in 100..<110 {
                print("🔵", i)
            }
        }
    }
}

