//
//  File.swift
//  rick&MortyMiniApp
//
//  Created by Mikhayl Romanovsky on 2023/8/19.
//

import SwiftUI


struct InfoBlock: View {
    private let species: String?
    private let type: String?
    private let gender: String?
    
    init(species: String?, type: String?, gender: String?) {
        self.species = species
        self.type = type
        self.gender = gender
    }
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Info")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                VStack(spacing: 0){
                    HStack {
                        Text("Species:")
                            .foregroundColor(Color("GrayNormal"))
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Text(species ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    }.padding()
                    HStack {
                        Text("Type:")
                            .foregroundColor(Color("GrayNormal"))
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Text(type ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    }.padding()
                    HStack {
                        Text("Gender:")
                            .foregroundColor(Color("GrayNormal"))
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Text(gender ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                    }.padding()
                    
                }.background(Color("CellBackGround"))
                    .cornerRadius(10)
            }
            .padding(.leading)
            .padding(.trailing)
            .padding(.top, 20)
    }
}
