//
//  PagingCollectionView.swift
//  SwiftUtilities
//
//  Created by Kingsley Okeke on 2022-04-13.
//

import SwiftUI

struct PagingCollectionView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        PagingCollectionViewController()
    }
}
