package com.visitorlogbook.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Visitor {
    private int id;
    private String name;
    private String mobile;
    private String personToMeet;
    private LocalDate visitDate;
    private LocalTime checkinTime;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public String getPersonToMeet() { return personToMeet; }
    public void setPersonToMeet(String personToMeet) { this.personToMeet = personToMeet; }

    public LocalDate getVisitDate() { return visitDate; }
    public void setVisitDate(LocalDate visitDate) { this.visitDate = visitDate; }

    public LocalTime getCheckinTime() { return checkinTime; }
    public void setCheckinTime(LocalTime checkinTime) { this.checkinTime = checkinTime; }
}

