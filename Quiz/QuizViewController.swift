//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["ホームズの助手かつ伝記作者であるワトソン博士の本名は？","ジェームズ・K・ワトソン","ジョージ・ワトソン","ジョン・H・ワトソン",3])
        quizArray.append(["シャーロックホームズの住んでいる場所は？","ベイカーSt.","オックスフォードSt.","キングスクロスSt.",1])
        quizArray.append(["ホームズの宿敵の名前は次のうちどれ？","ドレーニ伯爵","探偵ポアロ","モリアーティ教授",3])
        quizArray.append(["ホームズが宿敵と共に落ちた滝の名前は？","テディフォスの滝","ライヘンバッハの滝","ゴーザフォスの滝",2])
        quizArray.append(["ホームズとワトソン博士が初めて出会った場所は？","アフガニスタン","病院","殺人現場",2])
        quizArray.append(["シャーロックホームズの作者は？","アガサ・クリスティ","江戸川乱歩","コナン・ドイル",3])

        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz()
    }
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as!String
        
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle(quizArray[random][i+1] as! String, forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)")
        if quizArray[random][4]as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if sum == questionNumber {
            performSegueToResult()
        }
        quizArray.removeAtIndex(random)
        choiceQuiz()
    }
    
       func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    
            }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as!ResultViewController
        
            ResultView.correctAnswer = self.correctAnswer
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }


