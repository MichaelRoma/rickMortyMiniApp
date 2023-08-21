//
//  AsyncImage.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/21.
//

import SwiftUI

struct AsyncImage: View {
    var image: Image?
    var name: String?
    var status: String?
    
    init(image: Image? = nil, name: String?, status: String?) {
        self.image = image
        self.name = name
        self.status = status
    }
    
    var body: some View {
        if let image = image {
            image.resizable()
                .frame(width: 148, height: 148)
                .cornerRadius(20)
                .padding(.top, 20)
                
            Text(name ?? "")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(.white)
                .padding(.top, 5)
                
            Text(status ?? "")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color("PrimeGreen"))
                .padding(.top, 1)
            Spacer()
        } else {
            ProgressView()
        }
    }
}
