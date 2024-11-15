//
//  HomeView 2.swift
//  CryCurCon
//
//  Created by Varun Mehra on 11/11/24.
//


// HomeView.swift

import SwiftUI

struct Crypto: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let price: Double
    let change: Double
    let marketCap: String
    let volume: String
    let icon: String
    let graphColor: Color
}

struct HomeView: View {
    let trendingCryptos = [
        Crypto(name: "Bitcoin", symbol: "BTC", price: 56000.0, change: 2.5, marketCap: "$1.1T", volume: "$45B", icon: "bitcoinsign.circle.fill", graphColor: .orange),
        Crypto(name: "Ethereum", symbol: "ETH", price: 1800.0, change: -1.2, marketCap: "$800B", volume: "$20B", icon: "e.circle.fill", graphColor: .blue)
    ]
    
    let topGainers = [
        Crypto(name: "Litecoin", symbol: "LTC", price: 200.0, change: 8.3, marketCap: "$20B", volume: "$3B", icon: "l.circle.fill", graphColor: .green),
        Crypto(name: "Cardano", symbol: "ADA", price: 1.2, change: 6.1, marketCap: "$40B", volume: "$10B", icon: "a.circle.fill", graphColor: .purple)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header Section
                    HeaderView()
                    
                    // Trending Cryptos Section
                    CryptoSection(title: "Trending Cryptocurrencies", cryptos: trendingCryptos)
                    
                    // Top Gainers Section
                    CryptoSection(title: "Top Gainers", cryptos: topGainers)
                }
                .padding()
            }
            .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
            .navigationTitle("Crypto Tracker")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Welcome Back!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Track your favorite cryptocurrencies and stay updated with the latest trends.")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Button(action: {
                // Add action for "Explore Market"
            }) {
                Text("Explore Market")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.blue.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

struct CryptoSection: View {
    let title: String
    let cryptos: [Crypto]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            
            ForEach(cryptos) { crypto in
                CryptoCard(crypto: crypto)
            }
        }
    }
}

struct CryptoCard: View {
    let crypto: Crypto
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: crypto.icon)
                    .font(.system(size: 40))
                    .foregroundColor(crypto.graphColor)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(crypto.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("\(crypto.symbol) • $\(String(format: "%.2f", crypto.price))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(crypto.change > 0 ? "+" : "")\(String(format: "%.2f", crypto.change))%")
                        .font(.headline)
                        .foregroundColor(crypto.change > 0 ? .green : .red)
                    
                    Text("Market Cap: \(crypto.marketCap)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            HStack {
                GraphView(color: crypto.graphColor)
                    .frame(height: 40)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: {
                        // Add action for "Buy"
                    }) {
                        Text("Buy")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                    
                    Button(action: {
                        // Add action for "Details"
                    }) {
                        Text("Details")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.blue)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

struct GraphView: View {
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                path.move(to: CGPoint(x: 0, y: height * 0.7))
                path.addLine(to: CGPoint(x: width * 0.3, y: height * 0.2))
                path.addLine(to: CGPoint(x: width * 0.6, y: height * 0.8))
                path.addLine(to: CGPoint(x: width, y: height * 0.4))
            }
            .stroke(color, lineWidth: 2)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



