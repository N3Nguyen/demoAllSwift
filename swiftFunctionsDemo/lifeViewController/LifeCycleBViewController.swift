//
//  LifeCycleBViewController.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 22/06/2024.
//

import UIKit

class LifeCycleBViewController: UIViewController {
    //Initialization (Khởi tạo)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("", "", "", "")
        print("    Điều hướng vào LifeCycleAViewController")
        print("    init(coder:) (B)")
        // Thiết lập ban đầu
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("    init(nibName:bundle:) (B)")
        // Thiết lập ban đầu
    }
    
    //View Loading (Tải view)
    override func loadView() {
        super.loadView()
        print("    loadView (B)")
        // Tạo và thiết lập view thủ công nếu không sử dụng Interface Builder
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("    viewDidLoad (B)")
        // Thiết lập view và khởi tạo dữ liệu
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("    viewWillAppear (B)")
        // Cập nhật giao diện người dùng, dữ liệu mới
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("    viewDidAppear (B)")
        // Bắt đầu các tác vụ yêu cầu view đã được hiển thị
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("****************(B)******************")
        print("    viewWillDisappear (B)")
        // Lưu trạng thái, dừng các tác vụ đang chạy
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("    viewDidDisappear viewcontrollerB")
        print("________________Thoát (B)___________________")
        // Dừng các tác vụ yêu cầu view hiển thị
    }
    
    deinit {
        print("    deinit (B)")
        // Giải phóng tài nguyên
    }
    
    @IBAction func nextA(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
