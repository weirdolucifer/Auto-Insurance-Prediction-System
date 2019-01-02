(reset)

; These are the various templates that we are going to use to store the
; different factors due to different parameters.
(deftemplate driver-name(slot value))
(deftemplate age-factor(slot percentage))
(deftemplate vehicle-age-factor(slot percentage))
(deftemplate alcoholic-factor(slot percentage))
(deftemplate vehicle-cost-factor(slot percentage))
(deftemplate driving-skill-factor(slot percentage))
(deftemplate driver-offence-factor(slot percentage))
(deftemplate average-distance-factor(slot percentage))
(deftemplate traffic-factor(slot percentage))
(deftemplate gender-factor(slot percentage))
(deftemplate engine-factor(slot percentage))
(deftemplate security-system-factor(slot percentage))
(deftemplate marital-factor(slot percentage))
(deftemplate driving-experience-factor(slot percentage))
(deftemplate size-car-factor(slot percentage))
(deftemplate tenant-factor(slot percentage))


; Function for taking the input from the user.
(deffunction prompt()
    (printout t "Enter name: ")
    (bind ?name (read))
    (call ?details put "Name" ?name)

    (printout t "Enter Age: ")
    (bind ?age (read))
    (call ?details put "Age" ?age)

    (printout t "How old is the vehicle?: ")
    (bind ?vehicleAge (read))
    (call ?details put "VehicleAge" ?vehicleAge)

    (printout t "Alcoholic (Enter y or Y /n or N): ")
    (bind ?alcoholic (read))
    (call ?details put "Alcoholic" ?alcoholic)
    
    (printout t "Vehicle's cost (In lakhs): ")
    (bind ?vehicleCost (read))
    (call ?details put "VehicleCost" ?vehicleCost)
    
    (printout t "Driving Skill Score (out of 10): ")
    (bind ?drivingSkillScore (read))
    (call ?details put "DrivingSkillScore" ?drivingSkillScore)
    
    (printout t "Driver's Offence Points: ")
    (bind ?driverOffencePoints (read))
    (call ?details put "DriverOffencePoints" ?driverOffencePoints)
    
    (printout t "Average Distance travelled per day(in km): ")
    (bind ?averageDistancePerDay (read))
    (call ?details put "AverageDistancePerDay" ?averageDistancePerDay)
    
    (printout t "Traffic In Area (L or l /M or m /H or h): ")
    (bind ?traffic (read))
    (call ?details put "Traffic" ?traffic)
    
    (printout t "Gender (F or f /M or m): ")
    (bind ?gender (read))
    (call ?details put "Gender" ?gender)
    
    (printout t "Engine Type(D or d -> Diesel and P or p -> Petrol): ")
    (bind ?engineType (read))
    (call ?details put "EngineType" ?engineType)
    
    (printout t "Is security System installed? (Y or y /N or n): ")
    (bind ?securitySystem (read))
    (call ?details put "SecuritySystem" ?securitySystem)
    
    (printout t "Marital Status (Enter Y or y /N or n): ")
    (bind ?maritalStatus (read))
    (call ?details put "MaritalStatus" ?maritalStatus)

    (printout t "Driving Experience (In years): ")
    (bind ?drivingExperience (read))
    (call ?details put "DrivingExperience" ?drivingExperience)
    
    (printout t "Size of Car (Enter S or s /M or m /L or l): ")
    (bind ?sizeOfCar (read))
    (call ?details put "SizeOfCar" ?sizeOfCar)
    
    (printout t "Are you a tenant? (Enter Y or y/N or n): ")
    (bind ?tenant (read))
    (call ?details put "Tenant" ?tenant)
)


; This function is used to bind the name of the driver
(deffunction calc_name(?tmp)
	(bind ?val (call ?details get ?tmp))
	(return ?val)
)

; This function calculates the percentage due to age of the driver
(deffunction calc_age(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (<= ?val 18) (>= ?val 60))then
		(return 5)
	else
		(return 2)
	)
)

; This function calculates the percentage based on how old the vehicle is
(deffunction calc_vehicle_age(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(<= ?val 5)then
		(return 5)
	else
		(if (<= ?val 15) then 
			(return 2)
		else
			(return 0)
		)
	)
)

; This function calculates the percentage bsed on whether the driver is alcoholic or not
(deffunction calc_alcoholic(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "Y") (eq ?val "y"))then
		(return 5)
	else
		(return 0)
	)
)

; The percentage added based on the cost of the vehicle
(deffunction calc_vehicle_cost(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(<= ?val 5)then
		(return 2)
	else
		(if (<= ?val 15) then 
			(return 5)
		else
			(return 10)
		)
	)
)

; For calculating percentage based on the driving skill of the driver
(deffunction calc_driving_skill_score(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(<= ?val 4)then
		(return 5)
	else
		(if (<= ?val 7) then 
			(return 2)
		else
			(return 0)
		)
	)
)

; The percentage added due to driver's offence points
(deffunction calc_driver_offence_points(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(<= ?val 10)then
		(return 2)
	else
		(return 5)
	)
)

; The percentage added based on the average distance travelled per day
(deffunction calc_average_distance(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(<= ?val 20)then
		(return 2)
	else
		(return 5)
	)
)

; The percentage based on the traffic in the area where the driver lives
(deffunction calc_traffic(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "L") (eq ?val "l"))then
		(return 2)
	else
		(if (or (eq ?val "M") (eq ?val "m"))then 
			(return 3)
		else
			(return 5)
		)
	)
)

; This function is used to calculate the percentage based on the gender
(deffunction calc_gender(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "M") (eq ?val "m"))then
		(return 5)
	else
		(return 2)
	)
)

; Percentage based on whether the vehicle is diesel type or petrol type
(deffunction calc_engine_type(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "D") (eq ?val "d"))then
		(return 5)
	else
		(return 2)
	)
)

; This function calculates percentage based on whether security system is installed or not
(deffunction calc_security_system(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if( or (eq ?val "Y") (eq ?val "y"))then
		(return 3)
	else
		(return 0)
	)
)

; There is an additional percentage added if the driver is unmarried
(deffunction calc_marital_status(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "Y") (eq ?val "y"))then
		(return 0)
	else
		(return 3)
	)
)

; The percentage based on experience of the driver
(deffunction calc_driving_experience(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(<= ?val 5)then
		(return 5)
	else
		(if (<= ?val 15) then 
			(return 2)
		else
			(return 0)
		)
	)
)
; This function calculates the percentage based on the size of the car
(deffunction calc_size_car(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "L") (eq ?val "l"))then
		(return 5)
	else
		(if(or (eq ?val "M") (eq ?val "m"))then 
			(return 3)
		else
			(return 2)
		)
	)
)

; An additional percentage is added if the driver is a tenant or not
(deffunction calc_tenant(?tmp)
	(bind ?val (call ?details get ?tmp))
	(if(or (eq ?val "Y") (eq ?val "y"))then
		(return 3)
	else
		(return 2)
	)
)

(reset)



; We have used a hashtable (details) data structure for storing the
; various inputs provided by the user
(bind ?details (new java.util.Hashtable))


; Below are the various rules which uses the previously defined functions 
; These rules calculates the various factors and binds it to the template which are defined in the beginning
(defrule check_name
	=>
	(assert(driver-name (value (calc_name "Name") ) ) )
)

(defrule check_age
	=>
	(assert(age-factor (percentage (calc_age "Age" ) ) ) )
)


(defrule check_vehicle_age
	=>
	(assert(vehicle-age-factor (percentage (calc_vehicle_age "VehicleAge" ) ) ) )
)

(defrule check_alcoholic
	=>
	(assert(alcoholic-factor (percentage (calc_alcoholic "Alcoholic" ) ) ) )
)


(defrule check_vehicle_cost
	=>
	(assert(vehicle-cost-factor (percentage (calc_vehicle_cost "VehicleCost" ) ) ) )
)


(defrule check_driving_skill_score
	=>
	(assert(driving-skill-factor (percentage (calc_driving_skill_score "DrivingSkillScore" ) ) ) )
)

(defrule check_driver_offence_points
	=>
	(assert(driver-offence-factor (percentage (calc_driver_offence_points "DriverOffencePoints" ) ) ) )
)


(defrule check_average_distance
	=>
	(assert(average-distance-factor (percentage (calc_average_distance "AverageDistancePerDay" ) ) ) )
)

(defrule check_traffic
	=>
	(assert(traffic-factor (percentage (calc_traffic "Traffic" ) ) ) )
)

(defrule check_gender
	=>
	(assert(gender-factor (percentage (calc_gender "Gender" ) ) ) )
)

(defrule check_engine_type
	=>
	(assert(engine-factor (percentage (calc_engine_type "EngineType" ) ) ) )
)

(defrule check_security_system
	=>
	(assert(security-system-factor (percentage (calc_security_system "SecuritySystem" ) ) ) )
)

(defrule check_marital_status
	=>
	(assert(marital-factor (percentage (calc_marital_status "MaritalStatus" ) ) ) )
)

(defrule check_driving_experience
	=>
	(assert(driving-experience-factor (percentage (calc_driving_experience "DrivingExperience" ) ) ) )
)

(defrule check_size_car
	=>
	(assert(size-car-factor (percentage (calc_size_car "SizeOfCar" ) ) ) )
)

(defrule check_tenant
	=>
	(assert(tenant-factor (percentage (calc_tenant "Tenant" ) ) ) )
)

; This is the final function which adds up various factors and calculates the final 
; amount to be paid on a basic amount of 1000
(defrule printthis
	(driver-name (value ?tp))
	(age-factor (percentage ?tp1))
	(vehicle-age-factor(percentage ?tp2))
	(alcoholic-factor( percentage ?tp3))
	(vehicle-cost-factor( percentage ?tp4))
	(driving-skill-factor( percentage ?tp5))
	(driver-offence-factor( percentage ?tp6))
	(average-distance-factor( percentage ?tp7))
	(traffic-factor( percentage ?tp8))
	(gender-factor( percentage ?tp9))
	(engine-factor( percentage ?tp10))
	(security-system-factor( percentage ?tp11))
	(marital-factor( percentage ?tp12))
	(driving-experience-factor( percentage ?tp13))
	(size-car-factor( percentage ?tp14))
	(tenant-factor( percentage ?tp15))
		
	=>
	(bind ?sum (+ ?tp1 ?tp2 ?tp3 ?tp4 ?tp5 ?tp6 ?tp7 ?tp8 ?tp9 ?tp10 ?tp11 ?tp12 ?tp13 ?tp14 ?tp15))
	(bind ?avg (/ ?sum 15))
	(bind ?prem (* 1000 (+ 1 ?avg)))
;	(printout t ?tp1 crlf)
;	(printout t ?tp2 crlf)
;	(printout t ?tp3 crlf)
;	(printout t ?tp4 crlf)
;	(printout t ?tp5 crlf)
;	(printout t ?tp6 crlf)
;	(printout t ?tp7 crlf)
;	(printout t ?tp8 crlf)
;	(printout t ?tp9 crlf)
;	(printout t ?tp10 crlf)
;	(printout t ?tp11 crlf)
;	(printout t ?tp12 crlf)
;	(printout t ?tp13 crlf)
;	(printout t ?tp14 crlf)
;	(printout t ?tp15 crlf)
	(printout t crlf crlf "Total yearly Premium to be paid by Mr./Mrs./Ms " ?tp " is  " ?prem crlf)
) 

(prompt)
(run)


