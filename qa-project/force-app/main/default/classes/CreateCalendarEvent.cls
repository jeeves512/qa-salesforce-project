public with sharing class CreateCalendarEvent {
    public static void CreateEvent(List<Training__c> trainings) {
        List<Event>  events = new List<Event>();
        for(Training__c t : trainings){
            Event event = new Event(
                OwnerId = t.OwnerId,
                Subject = t.Name,
                DurationInMinutes = 8*60*24,
                StartDateTime = t.Start_Date__c,
                EndDateTime = t.Start_Date__c.addDays(8),
                Location = t.Location__c,
                WhatId = t.Id
            );
            events.add(event);
        }
        insert events;
    }
}
