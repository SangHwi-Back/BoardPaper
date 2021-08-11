//
//  Spinner.swift
//  BoardPaper
//
//  Created by 백상휘 on 2021/08/07.
//

import UIKit

class Spinner {
    
    static let shared = Spinner()
    
    func show(view: UIView) {
        
        DispatchQueue.main.async {
            
            let effView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
            
            effView.accessibilityIdentifier = tagForSpinner
            effView.alpha = 0.4
            effView.frame = CGRect(
                origin: view.center,
                size: view.frame.size
            )
            
            view.addSubview(effView)
            
            let indicator = UIActivityIndicatorView(frame: CGRect(
                    origin: view.center,
                    size: view.frame.size
                )
            )
            indicator.accessibilityIdentifier = tagForIndicator
            indicator.startAnimating()
            view.addSubview(indicator)
        }
    }
    
    func hide(view: UIView) {
        
        DispatchQueue.main.async {
            
            let effView = view.subviews.filter{$0.accessibilityIdentifier == tagForSpinner}.first as? UIVisualEffectView
            effView?.removeFromSuperview()
            
            let indicator = view.subviews.filter{$0.accessibilityIdentifier == tagForIndicator}.first as? UIActivityIndicatorView
            indicator?.stopAnimating()
            indicator?.removeFromSuperview()
        }
    }
}
