//
//  SearchAndFilterBar.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

struct SearchAndFilterBar: View {
    var body: some View {
        HStack{
            Images.magnifyingglass
            
            VStack(alignment :.leading , spacing: 2){
                Text(AppString.whereTo)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(AppString.anyWhereWeekGuest)
                    .font(.caption2)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Button(action: {}, label: {
                Images.lineHorizontalDecreaseCircle
                    .foregroundStyle(.black)
                    
            })
        }
        .padding(.horizontal)
        .padding(.vertical,10)
        .overlay{
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar()
}
