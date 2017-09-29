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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField1.rx.text                  // 4. rx_textは後述
            .map {$0}
            .bind(to: label1.rx.text)         // 6. labelに反映
            .addDisposableTo(disposeBag)    // 7. 不要になったらunsubscribe
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
