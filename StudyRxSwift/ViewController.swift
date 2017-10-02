//
//  ViewController.swift
//  StudyRxSwift
//
//  Created by Yuu Ogasa on 2017/09/29.
//  Copyright © 2017年 SundayCarpenter. All rights reserved.
//

import UIKit
import RxSwift      // 1. RxSwiftインポート
import RxCocoa      // 2. RxCocoaインポート

let disposeBag = DisposeBag()   // 3. unsubscribeに必要なもの？

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var textField1: UITextField!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textFieldの値をラベルに伝える
        textField1.rx.text                  
            .map {$0}
            .bind(to: label1.rx.text)         // 6. labelに反映
            .addDisposableTo(disposeBag)    // 7. 不要になったらunsubscribe
        
        //モデルの値をTextFieldに伝える
        viewModel.text.asObservable()
            .bind(to:label1.rx.text)
            .addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        viewModel.text.value = "ボタンが押されたお"
    }
    
}
