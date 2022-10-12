# Announcements framework


The subclass can have instance variables for additional information to pass along, such as a timestamp, or mouse coordinates at the time of the event, or the old value of the parameter that has changed. 

To signal the actual occurrence of an event, the "announcer" creates and configures an instance of an appropriate announcement, then broadcasts that instance. Objects subscribed to receive such broadcasts from the announcer receive a broadcast notification together with the instance. They can talk to the instance to find out any additional information about the event that has occurred!



```
	   
```
```

```
