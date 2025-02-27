//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by Abdurrahman Arıcan on 25.02.2025.
//

import SwiftUI

struct ExploreView: View {
    
    var images : [String] =  [
        "house-1",
        "house-2",
        "house-3",
        "house-4",
    ]
    @State private var showDestinationSearchView = false
    var body: some View {
        NavigationStack{
            
            if showDestinationSearchView { DestinationSearchView(show: $showDestinationSearchView) }
            else{
                VStack{
                    SearchAndFilterBar()
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    ScrollView{
                        
                        LazyVStack(spacing : 32){
                            ForEach(0 ... 10 , id: \.self ){ listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(images: images, location:"Manavgat - Antalya" , distance:"12 mil away" , date: "Nov 3 - 10", price: "$567", priceType: "night", score: "4.8")
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationDestination(for: Int.self) { listing in
                        ListingDetailView(images: images, placeTitle: "Miami Villa",
                                          score: "4.8",
                                          reviews: "28",
                                          location: "Miami Florida",
                                          hostPerson: "Entire villa hosted by John Smith",
                                          placeFeatures: "4 guests - 4 bedrooms - 4 beds - 3 baths",
                                          hostPersonImagePath: "profile-woman",
                                          placePrice: "$500",
                                          placePriceDate: "Oct 15 - 20"
                                          
                        )
                            .navigationBarBackButtonHidden()
                            .navigationBarHidden(true)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
