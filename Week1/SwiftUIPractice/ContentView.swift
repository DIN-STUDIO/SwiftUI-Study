//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by HyoTaek on 10/2/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isChangeProfile = false
    @State private var isChangeButton = false
    
    private let imageURL = "https://i.namu.wiki/i/Mmn329Kk-bEN6x8d00tjFF6Q-XUg7yGCCFoMtMF1OC-r3FdyMFPz7yKIkehTu43_ZLLqM3B4iH0Z6kT59Et0NQ.webp"
    
    func fetchImageView(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { Image in
            Image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
        .overlay(RoundedRectangle(cornerRadius: 100).stroke(.black, lineWidth: 1))
        .opacity(0.8)
    }
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 30) {
        VStack(spacing: 30) {
            Text("권핑핑")
                .font(.system(size: 30, weight: .heavy, design: .serif))
                .foregroundStyle(Color.white)
                .background(
                    Group {
                        if isChangeProfile {
                            fetchImageView(url: imageURL)
                        }
                        else {
                            Image("돼지 궈뇨택")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(100)
                                .clipShape(Circle())
                                .opacity(0.8)
                        }
                    }
                )
            
            Spacer()
                .frame(height: 70)
            
            Text("안녕하세요 수업 띵까띵까하고 있는 권효택입니다. 수업시간에 딴 짓 하니까 재밌네요.")
                .font(.system(size: 20, weight: .semibold, design: .serif))
                .frame(width: 300)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .foregroundColor(isChangeButton ? .red : .black)
//                .lineSpacing(50)
            
            Spacer()
                .frame(height: 45) // 30 + 45 = 75
            
            Text(Date(), style: .time)
                .font(.system(size: 18, weight: .bold, design: .serif))
                .italic()
            
            HStack(spacing: 20) {
                Button(action: {
                    self.isChangeProfile.toggle()
                }) {
                    HStack() {
                        Image(systemName: "paintpalette")
                            .foregroundColor(.white)
                        
                        Text("사진 변경")
                            .font(.system(size: 18, weight: .bold, design: .serif))
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(isChangeProfile ? .gray : .black)
                .cornerRadius(20)
                
                Button(action: {
                    self.isChangeButton.toggle()
                }) {
                    HStack() {
                        Image(systemName: "photo")
                            .foregroundColor(.white)
                        
                        Text("텍스트 색 변경")
                            .font(.system(size: 18, weight: .bold, design: .serif))
                            .foregroundStyle(.white)
                    }
                }
                .padding()
                .background(isChangeButton ? .gray : .black)
                .cornerRadius(20)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
