//
//  notificationView.swift
//  CryCurCon
//
//  Created by Varun Mehra on 11/11/24.
//

import SwiftUI

struct NotificationView: View {
    // Sample notification data
    var cryptoName: String = "Bitcoin"
    var priceChange: Double = 5.0
    var timestamp: String = "2 mins ago"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "bitcoinsign.circle.fill") // Cryptocurrency icon
                    .font(.system(size: 40))
                    .foregroundColor(.orange)
                
                VStack(alignment: .leading) {
                    Text("Crypto Alert!")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("\(cryptoName) price has \(priceChange > 0 ? "increased" : "decreased") by \(String(format: "%.1f", abs(priceChange)))%")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                }
                Spacer()
            }
            
            Text(timestamp)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            
            Button(action: {
                // Add action to dismiss or view more details
            }) {
                Text("View Details")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(priceChange > 0 ? Color.green : Color.red) // Green for increase, red for decrease
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black) // Background for better visibility in preview
    }
}

