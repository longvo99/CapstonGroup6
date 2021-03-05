package edu.group6.capston.utils;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
 
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class readFileJson {

	public static void main(String[] args) {
		// JSON parser object to parse read file
		JSONParser jsonParser = new JSONParser();

		try (FileReader reader = new FileReader("../resources/admin/assets/js/city_district_ward.json")) {
			// Read JSON file
			Object obj = jsonParser.parse(reader);

			JSONArray employeeList = (JSONArray) obj;
			System.out.println(employeeList);

			// Iterate over employee array
			employeeList.forEach(emp -> parseEmployeeObject((JSONObject) emp));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	private static void parseEmployeeObject(JSONObject employee) {
		// Get employee first name
		String firstName = (String) employee.get("id");
		System.out.println(firstName);

		// Get employee last name
		String lastName = (String) employee.get("name");
		System.out.println(lastName);

		// Get employee website name
		String website = (String) employee.get("parent_id");
		System.out.println(website);
	}
}
