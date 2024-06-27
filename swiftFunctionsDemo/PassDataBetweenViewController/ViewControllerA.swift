//
//  ViewControllerA.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 05/06/2024.
//

import UIKit

class ViewControllerA: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataPassTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var getDataNotiButton: UIButton!
    @IBOutlet weak var getDataClosureButton: UIButton!
    
    var gradientLayer: CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Đăng ký lắng nghe 1 thông báo từ DidReceiveData
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: .didReceiveData, object: nil)
        
        //Đăng ký lắng nghe 1 thông báo truyền object
        NotificationCenter.default.addObserver(self, selector: #selector(handleListMoviesNotification(_:)), name: .listMoviesNotification, object: nil)
        
        //        customeButton(button: addButton)
        
        // Sử dụng lớp AnimatedBackgroundView cho background
        let animatedBackgroundView = AnimatedBackgroundView(frame: view.bounds)
        view.insertSubview(animatedBackgroundView, at: 0)
        
        addButton.applyAnimatedButtonStyle()
        getDataNotiButton.applyAnimatedButtonStyle()
        getDataClosureButton.applyAnimatedButtonStyle()
    }
    
    //Truyền data sử dụng Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showViewControllerBSegue" {
            if let destinationVC = segue.destination as? ViewControllerB {
                destinationVC.data = dataLabel.text
            }
        }
    }
    
    @objc func handleNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo, let data = userInfo["data"] as? String {
            dataPassTextView.text = data
        }
    }
    
    @objc func handleListMoviesNotification(_ notification: Notification) {
        if let listMovies = notification.userInfo?["listMovies"] as? ListMovies {
            //in ra dữ liệu thu được từ view gửi dữ liệu
            print("Received ListMovies - Page: \(listMovies.page), Total Results: \(listMovies.totalResults ?? 0)")
            for movie in listMovies.results {
                print("Movie ID: \(movie.id), Title: \(movie.title)")
            }
        }
        
        //trường hợp nhiều phần tử
//        DispatchQueue.main.async {
//            if let listMovies = notification.userInfo?["listMovies"] as? ListMovies {
//                print("Received ListMovies - Page: \(listMovies.page), Total Results: \(listMovies.totalResults ?? 0)")
//                for movie in listMovies.results {
//                    print("Movie ID: \(movie.id), Title: \(movie.title)")
//                }
//            }
//        }
    }
    
    deinit {
        // Hủy đăng ký nhận thông báo khi view controller bị giải phóng
        NotificationCenter.default.removeObserver(self, name: .didReceiveData, object: nil)
    }
    
    func passDataBasic() {
        let a = dataPassTextView.text.description
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerC = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            // Truyền dữ liệu
            viewControllerC.dataPass = a
            navigationController?.pushViewController(viewControllerC, animated: true)
        }
    }
    
    func passDataDelegate() {
        // Khởi tạo ViewControllerDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerDelegate = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            // Thiết lập ViewControllerA làm delegate của ViewControllerDelegate
            viewControllerDelegate.delegateData = self
            // Hiển thị ViewControllerDelegate
            navigationController?.pushViewController(viewControllerDelegate, animated: true)
        }
    }
    
    func passDataNotifi() {
        passDataBasic()
    }
    
    func passDataClosures() {
        // Khởi tạo ViewControllerDelegate
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewControllerDelegate = storyboard.instantiateViewController(withIdentifier: "showDelagate") as? ViewControllerDelegate {
            // Thiết lập closure
            viewControllerDelegate.completionHandler = { [weak self] data in
                self?.dataPassTextView.text = data
            }
            // Hiển thị ViewControllerDelegate
            navigationController?.pushViewController(viewControllerDelegate, animated: true)
        }
    }
    
    @IBAction func addPassData(_ sender: Any) {
        passDataDelegate()
        UIView.animate(withDuration: 0.1, animations: {
            self.addButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { _ in
            UIView.animate(withDuration: 2) {
                self.addButton.transform = CGAffineTransform.identity
            }
        }
    }
    @IBAction func getDataNoti(_ sender: Any) {
        passDataNotifi()
    }
    
    @IBAction func getDataClosure(_ sender: Any) {
        passDataClosures()
    }
    @IBAction func lifeCycleViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let lifeCycleViewController = storyboard.instantiateViewController(withIdentifier: "lifeCycleA") as? LifeCycleAViewController {
            navigationController?.pushViewController(lifeCycleViewController, animated: true)
        }
    }
    
}
extension ViewControllerA: passDataDelegate{
    func didReceiveData(_ data: String?) {
        dataPassTextView.text = data
    }
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
}
