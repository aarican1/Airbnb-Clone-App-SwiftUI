//
//  CollapsedPickerView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

struct CollapsedPickerView: View {
    let title : String
    let description : String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            
            .font(.subheadline)
            .fontWeight(.semibold)
        }
    }
}

#Preview {
    CollapsedPickerView(title: "test", description: "test")
}
