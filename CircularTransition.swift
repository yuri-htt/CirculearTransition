//
//  CirculearTranition.swift
//  CirculearTransition
//
//  Created by 田山　由理 on 2016/11/25.
//  Copyright © 2016年 Yuri Tayama. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {

    var circle = UIView()
    
    //開始位置が変更されたらセンターも同じ場所とする
    var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    var circlarColor = UIColor.white
    
    var duration = 0.3
    
    enum CirclarTransitionMode:Int {
        case present, dismiss, pop
    }
    
    var transitionMode:CirclarTransitionMode = .present
}

//http://qiita.com/kitoko552/items/4c0e411ff6224090db87
//UIViewControllerAnimatedTransitioningを使うと簡単に画面遷移のあイメーションが作成できる
//必須メソッドは２つ
extension CircularTransition: UIViewControllerAnimatedTransitioning {
    
    //アニメーションにかける時間
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    //具体的なアニメーションの内容
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            //多分遷移先のVC
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size

                circle = UIView()
                
                circle.frame = frameForCircle(withViewController: viewCenter, size: viewSize, startPoint: startingPoint)
                
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                circle.backgroundColor = circlarColor
                circle.transform = CGAffineTransform(scaleX:0.001, y:0.001)
                containerView.addSubview(circle)
                
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: {
                    self.circle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    }, completion: { (success:Bool) in
                        transitionContext.completeTransition(success)
                })
            }
        } else {
            let trasitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to :UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: trasitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                circle.frame = frameForCircle(withViewController: viewCenter, size: viewSize, startPoint: startingPoint)
                
                circle.layer.cornerRadius = circle.frame.size.height / 2
                circle.center = startingPoint
                
                UIView.animate(withDuration: duration, animations: { 
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0
                    
                    if transitionMode == .pop {
                        containerView.insertSubview(returningView, belowSubview: returningView)
                        containerView.insertSubview(self.circle, belowSubview: returningView)
                    }
                    }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
            }
            
        }
        
    }
    
    func frameForCircle (withViewController viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect {
        
        //fmin/fmax:浮動小数点数の計算誤差で 1.0 や -1.0 をわずかに超えてしまう場合への対処
        //ボタンの中央からそれぞれの壁までの距離を算出
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        //sqrt:ルート
        //x^2 + y^2 = r^2   
        //r = √x^2 + y^2
        let offsetVector = sqrt(xLength * xLength + yLength * yLength) * 2//直径
        let size = CGSize(width: offsetVector, height:offsetVector)
        
        return CGRect(origin: CGPoint.zero, size:size)
    }
    
}






