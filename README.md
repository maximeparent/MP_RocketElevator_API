# Rocket-Elevator-Foundation
WEEK 10

- rcktelevator.com

- The vulnerability security manual : vulnerability_review_MP.pdf

Link for the API REST : https://github.com/maximeparent/API-REST-MaximeParent

Features :
- One relational databse (mysql);
- One datawarehouse (postgresql);
- Multiple tables with relations;
- Contact form w/ submit POST REQUEST;
- Backoffice (admin panel) with charts;
- Rake task to fully operate the databases.
- Zendesk API;
- Sendgrid API;
- Twilio API;
- Slack API;
- Dropbox API;
- Google Maps API;
- IBM-Watson API;


INSTRUCTIONS

Admin email/pass : mathieu.houde@codeboxx.biz / password For the admin pannel - Look in the navigation bar for the admin pannel button. For the charts - Open up the admin panel, look at the dashboard page and you should see a clickable link in the chat section.

RAKE TASK

Rake dwh:clear : truncates the mysql tables
Rake dwh:cleardwh : truncates the postgresql tables
Rake dwh:fake : truncates the mysql tables AND fakes all the information
Rake dwh:populate : populates all the tables in the datawarehouse
Rake dwh:update : truncates the postgresql tables AND populates them

ZENDESK : send a quote/use the contact form;
          send a form/use the interventions tab;

SENDGRID : Complete the contact form by fill the given fields; The Sendgrid API will automatically send you a confirmation e-mail;

SLACK :By changing the status of an elevator in the AminPanel/Elevators, the API will automatically send you a message on your personal slack to inform you that the elevator status had been changed; 

DROPBOX (local) : in the customer.rb model, change "client.upload("/test4.txt", "Hello")" with a different number at the end of "test4". For example, if it's currently test8, change to test9. Afterwards, in the admin panel on the website, go in customers and create a new one with the full name, email and an assigned user & address. On the dropbox account, you will be able to see it. Dropbox credentials : maxparent7@gmail.com/teamweek7;

TWILIO :Twilio will automatically send a notification text to the maintenance operator that the status of a elevator has now switch to « Intervention ».   To try it out with Serge Savoie’s phone number: You have to modify the elevator **** #240 **** wich is associated to the building #56 that poses all of the necessary data to reach Serge’s cellphone;

IBM-WATSON : Simply go on the dashboard! Clicking the generate button will re-create the .wav file, but for it to actually be loaded in the audio player, the cache must be refreshed which sometimes takes some time.
