create database ola;
use ola;

#1. Retrieve all successful bookings:
CREATE View Sucessful_Bookings As
 SELECT * FROM bookings
 WHERE Booking_Status = 'Success';
 SELECT * FROM Sucessful_Bookings;
 
#2. Find the average ride distance for each vehicle type:
CREATE View ride_distance_for_each_vehicle As
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings
GROUP BY Vehicle_Type;
select * FROM ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
CREATE View  cancelled_rides_by_customers As 
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';
select * from cancelled_rides_by_customers ;

#4. List the top 5 customers who booked the highest number of rides:
create view Top_5_Customers As
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
select * from Top_5_Customers;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Rides_Canceled_by_Driver_P_C_Issues As
Select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';
select * from Rides_Canceled_by_Driver_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
Create View Max_Min_Driver_Rating As
select MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
select * from Max_Min_Driver_Rating;

 #7. Retrieve all rides where payment was made using UPI:
 create view UPI_Payments As 
 select * from bookings
 where Payment_Method = 'UPI';
 select * from UPI_Payments;
 
  #8. Find the average customer rating per vehicle type:
  create view AVG_Cust_Rating As 
  SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
  FROM bookings
  GROUP BY Vehicle_Type;
  SELECT * From AVG_Cust_Rating ;
  
  #9. Calculate the total booking value of rides completed successfully:
 Create View total_successful_ride_value As
 SELECT SUM(Booking_Value) as total_successful_ride_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 select * from total_successful_ride_value ;

 #10. List all incomplete rides along with the reason:
 Create View Incomplete_Rides_Reason As
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
 select * from Incomplete_Rides_Reason;