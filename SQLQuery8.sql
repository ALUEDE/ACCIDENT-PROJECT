SELECT *
FROM [ACCIDENT PROECT]..accident$

SELECT *
FROM [ACCIDENT PROECT]..vehicle$


---ACCIDENT THAT OCCURRED IN URBAN AREA VS RURAL AREA

SELECT
  Area, 
  COUNT(Accidentindex) AS TotalAccident 
FROM
  [ACCIDENT PROECT]..accident$
GROUP BY
   Area


 --- DAY OF THE WEEK WITH THE HIGHEST NUMBER OF ACCIDENTS
 SELECT
  Day, 
  COUNT(Accidentindex) AS TotalAccident 
FROM
  [ACCIDENT PROECT]..accident$
GROUP BY
   Day
ORDER BY TotalAccident DESC

--- AVERAGE AGE OF VEHICLES INVOLVED IN ACCIDENT BASED ON THEIR TYPE

SELECT
  VehicleType, 
  COUNT(Accidentindex) AS TotalAccident, 
  AVG(Agevehicle) AS AverageYear
FROM [ACCIDENT PROECT]..vehicle$
WHERE AgeVehicle is not Null
GROUP BY
   Vehicletype
ORDER BY TotalAccident DESC

--- TRYING TO IDENTIFY TRENDS IN ACCIDENTS BASED ON THE AGE OF THE VEHICLE INVOLVED

SELECT
 AgeVehicle,
  COUNT ([AccidentIndex]) AS'Total Accident',
  AVG([Agevehicle]) AS'AverageYear',
	 CASE
	    WHEN Agevehicle BETWEEN 0 AND 5 THEN'New'
		WHEN Agevehicle BETWEEN 6 AND 10 THEN'Regular'
		ELSE'Old'
	END AS AgeGroup
 FROM [ACCIDENT PROECT]..vehicle$
 GROUP BY
   AgeVehicle
 
--- TRYING TO SEE IF THERE ARE SPECIFIC VEHICLE CONDITIONS WITH SEVERE ACCIDENTS

DECLARE @Severity varchar (100)
SET @SEVERITY = 'SERIOUS'
SELECT
  [WeatherConditions],
  COUNT ([Severity]) AS 'Total Accident'
FROM 
  [ACCIDENT PROECT]..accident$
WHERE 
    [Severity] = @severity
GROUP BY 
  [WeatherConditions]
ORDER BY 
  'Total Accident' DESC

  ---TRYING TO SEE IF ACCIDENTS OFTEN INVOLVE IMPACT ON THE LEFT HAND SIDE OF THE VEHICLE

SELECT
 [LeftHand],
 COUNT ([AccidentIndex])AS 'Total Accident'
FROM
  [ACCIDENT PROECT]..vehicle$
GROUP BY
  [LeftHand]
HAVING
  [LeftHand] IS NOT NULL










