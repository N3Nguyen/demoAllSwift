//
//  ViewControllerC.swift
//  swiftFunctionsDemo
//
//  Created by QuocTN on 05/06/2024.
//

import UIKit

class ViewControllerC: UIViewController {

    @IBOutlet weak var passDataTextView: UITextView!
    var data: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        passDataTextView.text = data
    }
    @IBAction func backA(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
