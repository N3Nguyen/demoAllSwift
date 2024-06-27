//
//  LifeCycleAViewController.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 22/06/2024.
//

import UIKit

class LifeCycleAViewController: UIViewController {

    //Initialization (Khởi tạo)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("", "")
        print("    Điều hướng vào LifeCycleAViewController")
        print("    init(coder:) (A)")
        // Thiết lập ban đầu
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("    init(nibName:bundle:) (A)")
        // Thiết lập ban đầu
    }
    
    //View Loading (Tải view)
    override func loadView() {
        super.loadView()
        print("    loadView (A)")
        // Tạo và thiết lập view thủ công nếu không sử dụng Interface Builder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("    viewDidLoad (A)")
//        extensionsProtocol()
        // Thiết lập view và khởi tạo dữ liệu
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("    viewWillAppear (A)")
        // Cập nhật giao diện người dùng, dữ liệu mới
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("    viewDidAppear (A)")
        // Bắt đầu các tác vụ yêu cầu view đã được hiển thị
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("****************(A)******************")
        print("    viewWillDisappear (A)")
        // Lưu trạng thái, dừng các tác vụ đang chạy
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("    viewDidDisappear (A)")
        print("________________Thoát (A)___________________")
        // Dừng các tác vụ yêu cầu view hiển thị
    }
    
    deinit {
        print("    deinit viewcontrollerA")
        // Giải phóng tài nguyên
    }
    
    func extensionsProtocol() {
        let instance = DefaultStruct()
        instance.requiredMethod()
        // Output: Default implementation of requiredMethod
    }
    
    @IBAction func nextB(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let lifeCycleViewController = storyboard.instantiateViewController(withIdentifier: "lifeCycleB") as? LifeCycleBViewController {
            navigationController?.pushViewController(lifeCycleViewController, animated: true)
        }
    }
}

extension LifeCycleAViewController: DefaultProtocol{
    func requiredMethod() {
        print("Default implementation of requiredMethod")
    }
    func requiTwo(){
        print("aloTwo")
    }
}
