//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
     var correctAnswer:Int = 0
    @IBOutlet var resultTextView : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    if(correctAnswer==5){
    resultTextView.text = String("君はホームズマニアだ！")
        }else if (correctAnswer==4){
        resultTextView.text = String("惜しい！あと少し")
        }else if (correctAnswer==3){
        resultTextView.text = String("もう一度チャレンジ！")
        }else if (correctAnswer==2){
        resultTextView.text = String("さあもう一回！")
        }else if (correctAnswer==1){
        resultTextView.text = String("再チャレンジしよう！")
        }else if (correctAnswer==0){
        resultTextView.text = String("まだまだ程遠い！")
        }
    }
    
        // Do any additional setup after loading the view.
    }

     func didReceiveMemoryWarning() {
        didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//GitHubテスト