//
//  MainViewCell.swift
//  Arbuz
//
//  Created by Bekbol Bolatov on 17.05.2024.
//

import SwiftUI

struct MainViewCell: View {
    let productImage: String
    let productTitle: String
    let productPrice: String
    let productUnit: String
    let productDiscount: String
    let isDiscounted: Bool
    
    @State private var isLiked = false
    @State private var isInBasket = false
    @State private var cnt = 0
    @State private var basketQuantity = 0
    
    let onTap: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
                productImageView
                productInfoView
            }
            .onTapGesture {
                onTap()
            }
            Spacer()
            actionButton
        }
        .frame(maxHeight: 190)
        .background(Color.white)
    }
    
    private var productImageView: some View {
        @StateObject var viewModel = ProductImageViewModel()
        
        return ZStack(alignment: .top) {
            // Main Image
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipped()
            } else {
                ProgressView()
                    .onAppear {
                        viewModel.fetchImage(from: productImage)
                    }
            }
            
            VStack {
                // Like Button
                likeButton
                Spacer()
                // Discount Label
                if isDiscounted {
                    discountLabel
                }
            }
        }
        .frame(height: 100)
        .cornerRadius(10)
    }
    
    private var likeButton: some View {
        HStack {
            Spacer()
            Button(action: {
                isLiked.toggle()
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .black)
                    .padding([.top, .trailing], 4)
            }
        }
    }
    
    private var discountLabel: some View {
        HStack {
            Text(productDiscount)
                .font(.system(size: 10))
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(5, corners: [.topRight, .bottomRight])
            Spacer()
        }
    }
    
    private var productInfoView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(productTitle)
                .font(.system(size: 10))
                .foregroundColor(.black)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack(spacing: 0) {
                Text(productPrice)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                Text("•")
                    .font(.system(size: 12))
                    .foregroundColor(.green)
                    .padding([.horizontal], 2)
                Text(productUnit)
                    .font(.caption)
                    .foregroundColor(.green)
                Spacer()
            }
        }
        .padding(.top, 8)
    }
    
    private var actionButton: some View {
        if cnt == 0 {
            return AnyView(addToBasketButton)
        } else {
            return AnyView(basketQuantityView)
        }
    }
    
    private var addToBasketButton: some View {
        Button(action: {
            // Increment the counter
            cnt += 1
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }) {
            CustomRectangle {
                HStack(spacing: 0) {
                    Text(productPrice)
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 18))
                        .foregroundColor(.green)
                }
                .padding(.horizontal, 10)
            }
        }
    }
    
    private var basketQuantityView: some View {
        CustomRectangle(backgroundColor: .green) {
            HStack(spacing: 0) {
                CustomButton(action: { cnt -= 1 }, imageName: "minus", fontSize: 18, foregroundColor: .white)
                Spacer()
                Button {
                    onTap()
                } label: {
                    Text("\(cnt)")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Spacer()
                CustomButton(action: { cnt += 1 }, imageName: "plus", fontSize: 18, foregroundColor: .white)
            }
            .padding(.horizontal, 10)
        }
    }
}

struct CustomButton: View {
    let action: () -> Void
    let imageName: String
    let fontSize: CGFloat
    let foregroundColor: Color
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .font(.system(size: fontSize))
                .foregroundColor(foregroundColor)
        }
    }
}

struct CustomRectangle<Content: View>: View {
    var backgroundColor: Color = Color.init(red: 245/255, green: 245/255, blue: 245/255)
    let content: () -> Content
    
    var body: some View {
        Rectangle()
            .fill(backgroundColor)
            .frame(maxWidth: .infinity)
            .frame(height: 35)
            .cornerRadius(15)
            .overlay(
                content()
            )
    }
}
