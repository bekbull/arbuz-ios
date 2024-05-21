//
//  DetailView.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 19.05.2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if let product = viewModel.product {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                        
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text(product.title)
                                .font(.title)
                            
                            Text(product.title)
                                .font(.body)
                        }
                        .padding(.leading)
                    }
                }
            } else {
                ProgressView("Loading..")
            }
        }
        .onAppear {
            viewModel.fetchProduct()
        }
    }
}

