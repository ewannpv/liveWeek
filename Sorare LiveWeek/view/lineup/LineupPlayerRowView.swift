//
//  PlayerRowView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import SwiftUI

struct LineupPlayerRowView: View {
    let imageSize: CGFloat = 35
    let rowPadding:CGFloat = 10
    
    let player: Player
    var body: some View {
            HStack(alignment: .center) {
                ZStack {
                    AsyncImage(url: URL(string: player.avatarUrl), transaction: Transaction(animation: .spring())) { phase in
                        switch phase {
                        case .empty:
                            Color.purple.opacity(0.1)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                            
                        case .failure(_):
                            Image(systemName: "exclamationmark.icloud")
                                .resizable()
                                .scaledToFit()
                            
                        @unknown default:
                            Image(systemName: "exclamationmark.icloud")
                        }
                    }
                    .frame(width: imageSize, height: imageSize)
                }
                .padding(.all,5)
                .background(.purple.opacity(0.6))
                .cornerRadius(imageSize/3)

                
                VStack(alignment: .leading, spacing: 0) {
                    Text(player.displayName)
                        .font(.headline)
                    Text("Day")
                        .font(.footnote)
                        .padding(2)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                    
                }.padding(.leading,10)
                Spacer()
                Text("20")
                    .font(.bold(.body)())
                    .padding(2)
                    .background(.green)
                    .clipShape(Circle())
                    .foregroundColor(.white)

                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(rowPadding)


    }
    
}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        LineupPlayerRowView(player: Player.generatePlayerExample(num: 1))
    }
}
