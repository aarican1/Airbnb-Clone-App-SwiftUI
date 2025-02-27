//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

enum DestinationSearchOptions{
    case location
    case dates
    case guests
}


struct DestinationSearchView: View {
    
    @Binding var show : Bool
    @State private var destination  = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate    = Date()
    @State private var endDate      = Date()
    @State private var numGuests    = 0
    
    var body: some View {
       
        VStack(alignment : .leading){
            HStack {
                Button {
                    withAnimation(.snappy){
                        show.toggle()
                    }
                } label: {
                    Images.xMarkCircle
                        .imageScale(.large)
                        .foregroundStyle(.black)
                    
                }
            
                
                Spacer()
               
                if !destination.isEmpty || numGuests != 0{
                    Button {
                        destination = ""
                        startDate   = Date()
                        endDate     = Date()
                        numGuests   = 0
                        
                    } label: {
                        Text(AppString.clear)
                            .foregroundStyle(.black)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }

            }
            .padding(.horizontal)

            DestinationSearchOptionView(selectedOption: $selectedOption, selfOption: .location, collapsedTitle:AppString.whereTo, collapsedDescription: AppString.addLocation,
                componentHeight: 120, showView:AnyView(VStack(alignment: .leading){
                Text(AppString.whereTo)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    Images.magnifyingglass
                        .imageScale(.small)
                    
                    TextField(AppString.searchDestinations, text : $destination)
                        .font(.subheadline)
                }
                .frame(height:44)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1)
                        .foregroundStyle(Color(.systemGray4))
                    
                }
            }))
            
            DestinationSearchOptionView(selectedOption: $selectedOption, selfOption: .dates, collapsedTitle:AppString.when, collapsedDescription: AppString.addDates,
                componentHeight: 180,  showView:AnyView(VStack(alignment: .leading){
                Text(AppString.whenYourTrip)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                DatePicker(AppString.from, selection: $startDate, displayedComponents: .date)
                
                Divider()
                
                DatePicker(AppString.to, selection: $endDate, displayedComponents: .date)
                
                
            }))
            
           
            DestinationSearchOptionView(selectedOption: $selectedOption, selfOption: .guests, collapsedTitle:AppString.who, collapsedDescription: AppString.addGuests, componentHeight: 120, showView:AnyView(VStack(alignment: .leading){
                Text(AppString.whosComing)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Stepper{
                    Text("\(numGuests) \(AppString.adults)")
                        .fontWeight(.semibold)
                }
                onIncrement: {
                    numGuests += 1
                }
                onDecrement: {
                    guard numGuests > 0 else { return }
                        numGuests -= 1
                }
                
            }))
            
           
            Spacer()
        
        }
     
    }
}

#Preview {
    DestinationSearchView(show:.constant(false))
}


