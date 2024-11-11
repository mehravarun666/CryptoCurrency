//
//  HomeView 2.swift
//  CryCurCon
//
//  Created by Varun Mehra on 11/11/24.
//


// HomeView.swift

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            
            // Profile Card
            VStack {
                // Top profile section
                HStack {
                    // Profile picture placeholder
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 60, height: 60)
                        .overlay(Text("V").font(.title)) // Placeholder text for profile image
                    VStack(alignment: .leading) {
                        Text("VARUN MEHRA")
                            .font(.headline)
                        Text("varun45@inv.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "bell.fill") // Notification icon
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Portfolio balance section
                VStack(alignment: .leading) {
                    Text("Portfolio")
                        .font(.headline)
                        .foregroundColor(.gray)
                    HStack(alignment: .bottom) {
                        Text("$5,271.39")
                            .font(.system(size: 32, weight: .bold))
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text("+130.62%")
                                .foregroundColor(.green)
                            Text("+$2,979.23")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()

                // Analytics, Withdraw, and Deposit section
                HStack(spacing: 0) {
                    VStack {
                        Image(systemName: "chart.bar.fill") // Placeholder for Analytics icon
                        Text("Analytics")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)

                    Divider() // Vertical line
                        .frame(height: 40) // Set the desired height for the line

                    VStack {
                        Image(systemName: "arrow.up.circle.fill")
                        Text("Withdraw")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)

                    Divider()
                        .frame(height: 40)

                    VStack {
                        Image(systemName: "arrow.down.circle.fill") // Placeholder for Deposit icon
                        Text("Deposit")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                .padding(.horizontal)
                Rectangle()
                    .fill(Color.white) // Color of the divider
                        .frame(height: 10)
            }
            .background(Color.white) // Set the background to white
            .cornerRadius(20) // Rounded corners for the card
            .shadow(radius: 10) // Optional shadow for the card effect
            
            ZStack(alignment: .leading) {
                Image("InviteYourfriend")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipped()
                
                // Overlayed Text
                VStack(alignment: .leading) {
                    Text("Invite a friend and you can both get $10 in BTC")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width * 0.4, alignment: .leading) // Set width to 50% of the screen width
                        .padding(.leading, 10) // Adjust padding as needed
                }
                .padding()
            }
            .frame(height: 100) // Adjust frame height as needed
            .cornerRadius(20)

            // Market section
            VStack(alignment: .leading) {
                HStack {
                    Text("Market")
                        .font(.title2)
                        .bold()
                    Spacer()
                    Text("Sort by: Capitalization")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .padding(.horizontal)

                VStack {
                    CryptoRow(
                        logo: "bitcoinsign.circle.fill", // System placeholder; replace with actual logo name
                        name: "Bitcoin",
                        shortName: "BTC",
                        price: "$32,811.00",
                        percentChange: "-2.27%"
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    CryptoRow(
                        logo: "bitcoinsign.circle.fill", // System placeholder; replace with actual logo name
                        name: "Ethereum",
                        shortName: "ETH",
                        price: "$2,489.10",
                        percentChange: "+3.95%"
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    CryptoRow(
                        logo: "bitcoinsign.circle.fill", // Placeholder; replace with actual logo name
                        name: "Litecoin",
                        shortName: "LTC",
                        price: "$151.85",
                        percentChange: "+1.12%"
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    CryptoRow(
                        logo: "bitcoinsign.circle.fill", // Placeholder; replace with actual logo name
                        name: "Ripple",
                        shortName: "XRP",
                        price: "$0.77",
                        percentChange: "-1.56%"
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    CryptoRow(
                        logo: "bitcoinsign.circle.fill", // Placeholder; replace with actual logo name
                        name: "Cardano",
                        shortName: "ADA",
                        price: "$0.42",
                        percentChange: "+4.32%"
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    
                }
            }
            .padding(.top)

            Spacer()

            // Bottom Tab Bar
            HStack {
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "wallet.pass.fill")
                Spacer()
                Image(systemName: "arrow.2.circlepath.circle.fill")
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                Spacer()
                Image(systemName: "gearshape.fill")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}


struct CryptoRow: View {
    var logo: String // Logo image name
    var name: String // Crypto name
    var shortName: String // Short name (e.g., BTC)
    var price: String // Price in fiat (e.g., "$32,811.00")
    var percentChange: String // Percent change (e.g., "-2.27%")
    
    var body: some View {
        HStack {
            // Crypto logo
            Image(systemName: logo) // Placeholder for actual logo image
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Circle().fill(Color.gray)) // Optional background circle if using a placeholder

            VStack(alignment: .leading) {
                Text(name) // Crypto name
                    .font(.headline)
                Text(shortName) // Crypto short name
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(price) // Crypto price
                    .font(.headline)
                Text(percentChange) // Crypto percent change
                    .foregroundColor(percentChange.contains("-") ? .red : .green) // Red if negative, green if positive
                    .font(.caption)
            }
        }
        .padding(.vertical, 5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
