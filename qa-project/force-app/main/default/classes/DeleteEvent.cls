public with sharing class DeleteEvent {
    public static void DeleteCalenderEvent(List<Training__c> trainings) {
        List<Event> events = new List<Event>([SELECT Id 
                                            FROM Event 
                                            WHERE WhatId IN :trainings]);
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(Event e: events){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String> {'jeevan.james@accenture.com'});
            mail.setReplyTo('jeevan.james@accenture.com');
            String body =  'Training cancelled';
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
        delete events;
    }
}
