# Himama Timesheet Application

This a demo POC app for Himama Timesheet.

How to run 

- Clone the application from 

- Make sure you have rvm or rbenv and install ruby 2.7.1 

- Make sure you have bundler 

- Make sure you have postgres database

## Setup 


To start after cloning run
```
bundle install
```

Then 
```
yarn install
```

To migrate the database
```
rails db:migrate
```

Then start the application with
```
rails s
```


## Written Response 

Please describe your process for approaching the code challenge. What kind of planning
did you do? Did your plans change as you began coding?
- I resolved which technologies I need to realize challenge quickly. 
- I determined, which models, relationships, validations, and controllers I need to implement.  For example, gem devise allows build authenticate system fastly.
- Plans didnt change much just the approaches change. I had some new ideas here and there during the steps of development. . I can add an admin dashboard in the future. ERB should be changed to HAML. UI can be better.

● Describe the schema design you chose. Why did you choose this design? What other
alternatives did you consider?
- In fact, we have 2 models User and TimeEntry, 
- User Model: email and password for now (This should be expanded to add the first name and last name). For quick solution i just implemented only email.
- TimeEntry Model: 
starts_at: to indicate start time
finishes_at: to indicate end time

These models have relationships. Decided to go with a relational database.

Considered doing a domain driven design but for a short space of time this cannot be implement. Also considered adding a field for adding comments/reason for checking in and out.

 

● If you were given another day to work on this, how would you spend it? What if you were
given a month?
- I'll add a live timer to display the increasing time. 
- Add difference column in view to show difference in the check in and out period. 

- Add admin dashboard (it can be ActiveAdmin to a quick start).  
- Reports can be added with functionality to download records. 
- Also i will add more tests.
- Additional UI implementation
