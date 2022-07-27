//
//  PlayerRowView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 26/07/2022.
//

import SwiftUI

struct LineupPlayerRowView: View {
    
    // Constraints.
    let kImageSize: CGFloat = 35
    let kRowPadding: CGFloat = 10
    let kRoundedPadding: CGFloat = 5
    let kLeadingPlayerInfoPadding: CGFloat = 10
    
    // Images.
    let kImageFailure : String = "exclamationmark.icloud.fill"

    let player: Player
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                playerImage()
            }
            .padding(.all,kRoundedPadding)
            .background(.purple.opacity(0.6))
            .cornerRadius(kImageSize/3)
            
            
            VStack(alignment: .leading, spacing: 0) {
                Text(player.displayName)
                    .font(.headline)
                playerTag()
            }.padding(.leading,kLeadingPlayerInfoPadding)
            Spacer()
            Text(playerScore())
                .font(.footnote)
                .bold()
                .padding(kRoundedPadding)
                .background(.green)
                .clipShape(Circle())
                .foregroundColor(.white)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(kRowPadding)
    }
    
    // MARK: Private methods
    
    // Returns the player image.
    private func playerImage() -> some View {
        AsyncImage(url: URL(string: player.avatarUrl), transaction: Transaction(animation: .spring())) { phase in
            switch phase {
            case .empty:
                Color.purple.opacity(0.5)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                
            case .failure(_):
                Image(systemName:kImageFailure)
                    .resizable()
                    .scaledToFit()
                
            @unknown default:
                Image(systemName: kImageFailure)
            }
        }
        .frame(width: kImageSize, height: kImageSize)
    }
    
    // Returns a random player score between 60 and 99.
    private func playerScore() -> String {
        let score = Int.random(in: 60..<100)
        return "\(score)"
    }
    
    // Returns a random player tag.
    private func playerTag() -> some View {
        let tags = ["Tuesday","Friday","FT","Live"]
        let colors = [Color.gray, Color.red, Color.blue]
        
        return Text(tags.randomElement()!)
            .font(.footnote)
            .padding(.horizontal,4)
            .padding(.vertical, 2)
            .background(colors.randomElement().opacity(0.2))
            .cornerRadius(10)
    }

}

struct PlayerRowView_Previews: PreviewProvider {
    static var previews: some View {
        LineupPlayerRowView(player: Player.generatePlayerExample(num: 1))
    }
}
