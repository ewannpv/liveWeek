//
//  LineupListHeaderView.swift
//  Sorare LiveWeek
//
//  Created by Ewann Pellé on 27/07/2022.
//

import SwiftUI

// Header section of the LineupListView.
struct LineupListHeaderView: View {
    var gameWeekIndex: Int
    var gameWeek: GameWeek
    
    // Constraints.
    let kHorizontalButtonPadding : CGFloat = 20
    let kTopButtonPadding : CGFloat = 10
    
    // Images.
    let kSettingsImage : String = "gearshape.fill"
    let kNotificationsImage : String = "bell.fill"
    
    var body: some View {
        VStack(spacing:0) {
            HStack {
                Button {
                    print("Settings button was tapped")
                } label: {
                    Image(systemName: kSettingsImage)
                }
                .modifier(ButtonModifier())
                Spacer()
                Button {
                    print("Notifications button was tapped")
                } label: {
                    Image(systemName: kNotificationsImage)
                }
                .modifier(ButtonModifier())
                
            }
            .padding(.horizontal, kHorizontalButtonPadding)
            .padding(.top, kTopButtonPadding)
            .foregroundColor(.white)
            
            VStack {
                Text(WeekTitle(gameWeekIndex: gameWeekIndex))
                    .font(.largeTitle)
                    .italic()
                    .bold()
                    .foregroundColor(.white)
                Text(weekRange(gameWeek: gameWeek))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: Private methods
    
    // Returns the week range to display.
    private func weekRange(gameWeek:GameWeek) ->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd"
        
        guard let startDate  = dateFormatter.date(from: gameWeek.startDate),
              let endDate  = dateFormatter.date(from: gameWeek.endDate)
        else {return "Error: Invalid date range"}
        
        let startDateString = dateFormatterPrint.string(from: startDate)
        let endDateString = dateFormatterPrint.string(from: endDate)
        return "\(startDateString) - \(endDateString)"
    }
    
    // Returns the week title to display.
    private func WeekTitle(gameWeekIndex:Int) -> String {
        return gameWeekIndex == 0 ? "LIVE WEEK" : "NEXT WEEK"
    }
    
}

struct LineupListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LineupListHeaderView(gameWeekIndex: 0, gameWeek: GameWeek.generateGameWeekExample(num: 1)).background(.black)
    }
}
