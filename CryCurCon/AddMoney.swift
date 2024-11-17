//
//  AddMoney.swift
//  CryCurCon
//
//  Created by Varun Mehra on 17/11/24.
//
import SwiftUI

struct AddMoney: View {
    @State private var selectedCardIndex: Int? = nil
    
    @State private var cards = [
        (color: Color.purple, title: "Credit", balance: "$6,421.50", cardNumber: "**** **** **** 3479"),
        (color: Color.black, title: "Debit", balance: "$2,150.00", cardNumber: "**** **** **** 1234"),
        (color: Color.blue, title: "Savings", balance: "$12,345.67", cardNumber: "**** **** **** 5678")
    ]
    
    // Sample Transaction Data
    let transactions = [
        ("Send to Alphonso Davied", "$650", "Note: pay for the apartment electricity", "Mon, 05 Aug 2022", "15:30 PM"),
        ("Top Up Diamond Mobile Legend", "$250", "Codashop", "Mon, 05 Aug 2022", "16:00 PM")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("ADD MONEY")
                .font(.largeTitle)
                .padding()
            
            Spacer()
            
            // Rounded Buttons Section
            HStack(spacing: 30) {
                ActionButton(label: "Add Money", systemImage: "plus.circle.fill")
                ActionButton(label: "Move Money", systemImage: "arrow.right.arrow.left.circle.fill")
                ActionButton(label: "Send Money", systemImage: "paperplane.circle.fill")
            }
            
            // Cards Section
            ZStack {
                ForEach(cards.indices, id: \.self) { index in
                    DetailedCardView(
                        title: cards[index].title,
                        balance: cards[index].balance,
                        cardNumber: cards[index].cardNumber,
                        color: cards[index].color
                    )
                    .offset(x: CGFloat(index * 20), y: CGFloat(index * 25)) // Stacked offset
                    .scaleEffect(index == 0 ? 1 : 0.95) // Highlight top card
                    .onTapGesture {
                        withAnimation(.spring()) {
                            swapCards(with: index)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            // Transaction History Section
            VStack(alignment: .leading, spacing: 10) {
                Text("History Transaction")
                    .font(.headline)
                    .padding(.horizontal, 20)
                
                ForEach(transactions, id: \.0) { transaction in
                    TransactionRow(
                        title: transaction.0,
                        amount: transaction.1,
                        note: transaction.2,
                        date: transaction.3,
                        time: transaction.4
                    )
                }
            }
            .padding(.bottom, 20)
            
            Spacer()
        }
        .background(Color(UIColor.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
    
    /// Function to swap the selected card with the top card
    private func swapCards(with index: Int) {
        if index != 0 { // Ensure the selected card is not already the top card
            cards.swapAt(0, index)
        }
        cards.reverse()
    }
}

// Action Button View
struct ActionButton: View {
    let label: String
    let systemImage: String
    
    var body: some View {
        VStack {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .frame(width: 60, height: 60)
                .background(Color.green)
                .clipShape(Circle())
            Text(label)
                .font(.footnote)
                .foregroundColor(.black)
        }
    }
}

// Transaction Row View
struct TransactionRow: View {
    let title: String
    let amount: String
    let note: String
    let date: String
    let time: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
                Text(amount)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            Text(note)
                .font(.caption)
                .foregroundColor(.gray)
            HStack {
                Text(date)
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text(time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Divider()
        }
        .padding(.horizontal, 20)
    }
}

// Detailed Card View
struct DetailedCardView: View {
    let title: String
    let balance: String
    let cardNumber: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Credit")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(title == "Credit" ? .white : .gray.opacity(0.7))
                
                Text("Debit")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(title == "Debit" ? .white : .gray.opacity(0.7))
            }
            
            Spacer()
            
            HStack {
                Text("VISA")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Text("My Balance")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            
            Text(balance)
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Spacer()
            
            Text(cardNumber)
                .font(.headline)
                .foregroundColor(.white)
            
            HStack {
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .frame(height: 200)
        .background(color)
        .cornerRadius(15)
        .shadow(color: color.opacity(0.4), radius: 10, x: 0, y: 5)
    }
}

struct AddMoney_Previews: PreviewProvider {
    static var previews: some View {
        AddMoney()
    }
}



