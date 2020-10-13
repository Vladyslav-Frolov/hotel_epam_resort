package com.epam.finalproject.hotel.model;

public class FreeRooms extends Entity {

    private String roomType;
    private String roomClass;
    private Integer numberOfPeople;
    private Integer numberOfAdults;
    private Integer numberOfChidren;
    private Integer daysOfStay;
    private Double costPerDay;
    private Double totalPrice;

    public FreeRooms() {
    }

    public FreeRooms(int id, String roomType, String roomClass, Integer numberOfPeople,
                     Integer numberOfAdults, Integer numberOfChidren, Integer daysOfStay,
                     Double costPerDay, Double totalPrice) {
        super(id);
        this.roomType = roomType;
        this.roomClass = roomClass;
        this.numberOfPeople = numberOfPeople;
        this.numberOfAdults = numberOfAdults;
        this.numberOfChidren = numberOfChidren;
        this.daysOfStay = daysOfStay;
        this.costPerDay = costPerDay;
        this.totalPrice = totalPrice;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getRoomClass() {
        return roomClass;
    }

    public void setRoomClass(String roomClass) {
        this.roomClass = roomClass;
    }

    public Integer getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(Integer numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public Integer getNumberOfAdults() {
        return numberOfAdults;
    }

    public void setNumberOfAdults(Integer numberOfAdults) {
        this.numberOfAdults = numberOfAdults;
    }

    public Integer getNumberOfChidren() {
        return numberOfChidren;
    }

    public void setNumberOfChidren(Integer numberOfChidren) {
        this.numberOfChidren = numberOfChidren;
    }

    public Integer getDaysOfStay() {
        return daysOfStay;
    }

    public void setDaysOfStay(Integer daysOfStay) {
        this.daysOfStay = daysOfStay;
    }

    public Double getCostPerDay() {
        return costPerDay;
    }

    public void setCostPerDay(Double costPerDay) {
        this.costPerDay = costPerDay;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "FreeRooms{" +
                "room number=" + super.getId()+
                ", roomType='" + roomType + '\'' +
                ", roomClass='" + roomClass + '\'' +
                ", numberOfPeople=" + numberOfPeople +
                ", numberOfAdults=" + numberOfAdults +
                ", numberOfChidren=" + numberOfChidren +
                ", daysOfStay=" + daysOfStay +
                ", costPerDay=" + costPerDay +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
