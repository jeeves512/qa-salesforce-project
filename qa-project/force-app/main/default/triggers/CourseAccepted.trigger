trigger CourseAccepted on Training__c (after update) {
    List<Training__c>  trainings = new List<Training__c>();
    List<Training__c>  dTrainings = new List<Training__c>();
    for(Training__c t: Trigger.new){
        if(t.Training_Accepted__c && t.Stage__c !='Cancelled'){
            trainings.add(t);
        }else if(t.Training_Accepted__c && t.Stage__c =='Cancelled') {
            dTrainings.add(t);
        }
    }
    CreateCalendarEvent.CreateEvent(trainings);
    DeleteEvent.DeleteCalenderEvent(dTrainings);
}