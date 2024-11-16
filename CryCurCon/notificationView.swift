//
//  notificationView.swift
//  CryCurCon
//
//  Created by Varun Mehra on 11/11/24.
//

import SwiftUI

struct Notification: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let timestamp: String
    let icon: String
    let color: Color
}

struct NotificationView: View {
    // Sample notification data
    let notifications = [
        Notification(
            title: "Crypto Alert!",
            message: "Bitcoin price has increased by 5.2%.",
            timestamp: "2 mins ago",
            icon: "bitcoinsign.circle.fill",
            color: Color.orange
        ),
        Notification(
            title: "Stock Alert!",
            message: "Tesla shares have dropped by 3.4%.",
            timestamp: "10 mins ago",
            icon: "chart.line.downtrend.xyaxis",
            color: Color.red
        ),
        Notification(
            title: "Weather Update",
            message: "Heavy rain expected tomorrow. Stay safe!",
            timestamp: "1 hour ago",
            icon: "cloud.rain.fill",
            color: Color.blue
        )
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Notifications")
                    .font(.system(size: 30))
                    .foregroundColor(.black)
                
                ForEach(notifications) { notification in
                    NotificationCard(notification: notification)
                }
            }
            .padding()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct NotificationCard: View {
    let notification: Notification
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                Image(systemName: notification.icon)
                    .font(.system(size: 40))
                    .foregroundColor(notification.color)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(notification.title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(notification.message)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                }
                Spacer()
            }
            
            Text(notification.timestamp)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            
            Button(action: {
            }) {
                Text("View Details")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [notification.color.opacity(0.7), .black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(12)
        .shadow(color: notification.color.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .previewLayout(.sizeThatFits)
    }
}


