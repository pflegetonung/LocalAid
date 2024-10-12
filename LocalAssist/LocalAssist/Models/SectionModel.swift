//
//  SectionModel.swift
//  LocalAssist
//
//  Created by Phillip on 07.10.2024.
//

import Foundation
import SwiftUI

struct SectionCard: Identifiable {
    var id = UUID()
    var title: String
    var p1: String
    var p2: String
    var time: String
    var emoji: String
}

let sectionData = [
    SectionCard(title: "Getting Started with Volunteering",
                p1: "Volunteering is a fantastic way to contribute to the community, but getting started can feel overwhelming. Where do you begin? The good news is, anyone can volunteer. Whether you’re passionate about helping the environment, working with kids, or supporting local charities, there’s a cause waiting for you.",
                p2: "Start by considering what matters most to you. Are you drawn to hands-on work, like cleaning up beaches or helping at a food bank? Or do you prefer organizing events or managing online campaigns? Once you identify what drives you, we’ll guide you through the steps to find the right opportunities, how to sign up, and what to expect on your first day. Volunteering is about learning and growing, so take the first step and dive in!",
                time: "1-2 minutes",
                emoji: "⛅️"),
    
    SectionCard(title: "Top Tips for Volunteers",
                p1: "Volunteering is more than just showing up—it’s about making a meaningful impact while gaining personal growth. To maximize your efforts, you’ll want to stay organized and open-minded. The key is to be flexible and adaptable, as each experience brings its own set of challenges and rewards. Whether you’re working with people, animals, or the environment, every interaction is an opportunity to learn.",
                p2: "Effective communication with your team is critical. Stay engaged, ask questions, and don’t hesitate to offer your unique skills. And remember, balance is essential. Volunteering should enhance your life, not overwhelm it. Our tips will show you how to manage your time, avoid burnout, and truly enjoy the process of giving back. A positive mindset will help you make the most of every opportunity!",
                time: "2 minutes",
                emoji: "⭐️"),
    
    SectionCard(title: "How to Make Volunteering Count",
                p1: "Volunteering is a journey filled with opportunities to make a difference, and now you can also earn digital medals for your efforts! Our rewards system tracks your progress and celebrates your achievements with medals that reflect your commitment and impact. Whether you’ve completed your first project, volunteered consistently, or taken on a leadership role, there’s a medal waiting to recognize your contributions.",
                p2: "Setting goals is a great way to keep yourself motivated, and our medal system gives you milestones to aim for. You’ll be able to showcase your medals in your profile and feel proud of the positive change you’re making. Each step you take brings you closer to new rewards and personal growth, proving that every volunteer effort counts toward something bigger. Ready to start earning your medals?",
                time: "2 minutes",
                emoji: "🇺🇸")
]
