//
//  ChatView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/3/3.
//

import SwiftUI

// 数据模型
struct Message: Identifiable {
    let id = UUID()
    let text: String
    let isSent: Bool
    let timestamp: Date
}

// 主界面
struct ChatView: View {
    @State private var messages: [Message] = [
        Message(text: "你好！今天过得怎么样？", isSent: false, timestamp: Date()),
        Message(text: "还不错，刚完成一个SwiftUI项目！", isSent: true, timestamp: Date()),
        Message(text: "太棒了！能分享一下实现细节吗？", isSent: false, timestamp: Date())
    ]
    
    @State private var newMessage = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            // 消息列表
            ScrollView {
                ScrollViewReader { proxy in
                    LazyVStack(spacing: 12) {
                        ForEach(messages) { message in
                            MessageBubble(message: message)
                                .id(message.id)
                                .transition(.scale.combined(with: .opacity))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .onAppear { scrollProxy = proxy }
                }
            }
            .background(Color(.systemGroupedBackground))
            
            // 输入区域
            InputBar(newMessage: $newMessage, onSend: sendMessage)
        }
        .navigationTitle("聊天")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func sendMessage() {
        guard !newMessage.isEmpty else { return }
        
        withAnimation(.spring()) {
            let message = Message(
                text: newMessage,
                isSent: true,
                timestamp: Date()
            )
            messages.append(message)
            newMessage = ""
            
            // 自动滚动到底部
            DispatchQueue.main.async {
                scrollProxy?.scrollTo(messages.last?.id, anchor: .bottom)
            }
        }
    }
}

// 消息气泡组件
struct MessageBubble: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isSent {
                Spacer()
            }
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(message.text)
                    .foregroundColor(message.isSent ? .white : .primary)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(
                        message.isSent ? Color.blue : Color(.systemGray5)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .contextMenu {
                Button("复制") {
                    UIPasteboard.general.string = message.text
                }
                Button("删除", role: .destructive) { /* 删除逻辑 */ }
            }
            
            if !message.isSent {
                Spacer()
            }
        }
    }
}

// 输入栏组件
struct InputBar: View {
    @Binding var newMessage: String
    var onSend: () -> Void
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 12) {
            TextField("输入消息...", text: $newMessage, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(1...4)
                .submitLabel(.send)
                .onSubmit { onSend() }
            
            Button(action: onSend) {
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(newMessage.isEmpty ? .gray : .blue)
            }
            .disabled(newMessage.isEmpty)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.thickMaterial)
    }
}

// 预览
#Preview {
    NavigationStack {
        ChatView()
    }
}
