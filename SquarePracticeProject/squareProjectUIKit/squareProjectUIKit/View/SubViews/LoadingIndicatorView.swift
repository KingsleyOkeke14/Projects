//
//  LoadingIndicatorVC.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-29.
//

import UIKit
import SwiftUI

class LoadingIndicatorView: UIView {

    private lazy var indicator: UIActivityIndicatorView = {
        let ind =
        UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ind.color = .lightGray
        return ind
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(indicator)
        indicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func stopAnimation() {
        indicator.stopAnimating()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
