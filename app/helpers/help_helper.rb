module HelpHelper
    def faq! 
        faqList = Array.new(10)
        faqList[0] = ["How long can I rent a bike?", "A full battery could last up to 50 miles. You can check the bike's battery and its estimation of run to make your decision of which bike suits your ride!"]
        faqList[1] = ["What happens if I borrow a bike for longer than the original time that I paid for?", "Your card will get charged for the extra time the bike was used."]
        faqList[2] = ["Are there any restricted areas I can't go to with ValetBike?", "There are no restrictions as to where to bike, but make sure that a station is at most 30 minutes away from the furthest point you go. If you bike outside the Nipmuc Notch area and don't return the bike, you will pay a fee of $400."]
        faqList[3] = ["How can I check my bike's battery?", "Bikes' batteries are listed on the Station Map/List page of ValetBike. You can also check the battery through the small screen on your bike."]
        faqList[4] = ["Do I have to make an account to rent a bike?", "You must create an account to rent a bike. ValetBike doesn't offer guest renting services. We want to know who is using our services to keep things in check! Don't worry, we are not selling your data to anyone."]
        faqList[5] = ["Does ValetBike offer subscriptions?", "We are planning on offering monthly/yearly subscriptions but as of right now, we only offer payment per ride."]
        faqList[6] = ["What forms of payment does ValetBike offer?", "Each account has a balance credit. Bikers can enter their credit card information and enter the amount of money they want to add to their account. Bikers can pay for their rides through the balance."]
        faqList[7] = ["How many bikes can I rent at once?", "You can rent only one bike at a time."]
        faqList[8] = ["Do I have to return the bike to the same station from where I picked it up?", "No! We want you to explore the area. You can dock it at any ValetBike station."]
        faqList[9] = ["What if there are no empty docks at the station I'm currently at?", "We have designed the stations such that they are not far away from each other. You might need to bike for extra minutes to the next available station. You can check which stations have available docks on the station map on the website."]
        return faqList
    end
end
