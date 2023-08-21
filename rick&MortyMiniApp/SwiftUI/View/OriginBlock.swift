//
//  OriginBlock.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/21.
//

import SwiftUI

struct OriginBlock: View {
    var origin: Origin?
    
    init(origin: Origin?) {
        self.origin = origin
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Origin")
                .font(.system(size: 17, weight: .bold))
               .foregroundColor(.white)
            VStack(spacing: 0){
                HStack{
                    ZStack{
                        Rectangle().fill(Color("BlackElement"))
                            .frame(width: 64, height: 64)
                            .cornerRadius(10)
                            .padding()
                        Image("Planet")
                    }
               
                    VStack {
                        Text(origin?.name ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text(origin?.type ?? "")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color("PrimeGreen"))
                            .padding(.top, 1)
                    }.frame(height: 80)
                    Spacer()
                }
                
            }.background(Color("CellBackGround"))
                .cornerRadius(10)
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.top, 20)
    }
}
