# CirculearTransition

Create a Circular Transition Animation by using "Custom UIViewController Transitions"


iOS 7から、画面遷移のアニメーションをカスタマイズできるようになりました。

今回はこちらのチュートリアル動画を参考に、ボタンに画面遷移のアニメーションを実装しました。   
<https://www.youtube.com/watch?v=-BiGO7CJZ7Q&list=PLY1P2_piiWEaaeO49ria36p6lQ1uk0q_F>


##【関連プロトコル】

・UIViewControllerAnimatedTransitioning（アニメーションコントローラ)  
・UIViewControllerContextTransitioning（画面遷移コンテキスト）  
・UIViewControllerTransitioningDelegate (画面遷移デリゲート※）  



##【実装手順】
###1)アニメーションコントローラの作成
画面遷移時に用いるアニメーションの実態をUIViewControllerAnimatedTransitioningを採用したクラスで実装する。  
このとき、UIViewControllerAnimatedTransitioningを採用したクラスのことをアニメーションコントローラと呼ぶ。  

###2)画面遷移コンテキストに遷移情報を記載
UIViewControllerContextTransitioningを採用したオブジェクトに遷移情報を記載。  
この時、UIViewControllerContextTransitioningを採用したオブジェクトのことを画面遷移コンテキストと呼ぶ。  
画面遷移コンテキストは遷移先、遷移元などの画面遷移に必要な情報を管理する。  

###3)アニメーションコントローラーを指定
遷移元のVCで画面遷移デリゲート(UIViewControllerTransitioningDelegate)を採用し、画面遷移時のアニメーションコントローラを指定する。  



