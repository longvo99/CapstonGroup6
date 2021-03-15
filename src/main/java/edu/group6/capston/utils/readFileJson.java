package edu.group6.capston.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import edu.group6.capston.dtos.CityDistrictWard;

public class readFileJson {

	private static List<CityDistrictWard> readFileJsonCity() {
		JSONParser jsonParser = new JSONParser();
		List<CityDistrictWard> list = new ArrayList<>();
		try {
			// Read JSON file
			File fileDir = new File(
					"E:\\Học Tập\\Github\\Capston-Group6-IS1301\\CapstonGroup6\\src\\main\\webapp\\WEB-INF\\resources\\admin\\assets\\js\\city_district_ward.json");
			BufferedReader in = new BufferedReader(new InputStreamReader(new FileInputStream(fileDir), "UTF-8"));
			Object obj = jsonParser.parse(in);
			JSONArray employeeList = (JSONArray) obj;
			for (Object object : employeeList) {
				list.add(readFileJson.parseEmployeeObject((JSONObject) object));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	private static CityDistrictWard parseEmployeeObject(JSONObject employee) {
		String id = (String) employee.get("id");
		String name = (String) employee.get("name");
		String parent_id = (String) employee.get("parent_id");
		CityDistrictWard obj = new CityDistrictWard(id, name, parent_id);
		return obj;
	}
	
	public static List<CityDistrictWard> getName(String city, String district, String ward) {
		List<CityDistrictWard> listJson = readFileJson.readFileJsonCity();
		List<CityDistrictWard> listJsonNew = new ArrayList<>();
		for (CityDistrictWard cityDistrictWard : listJson) {
			if(cityDistrictWard.getId().equals(city)) {
				listJsonNew.add(cityDistrictWard);
			}else if(cityDistrictWard.getId().equals(district)) {
				listJsonNew.add(cityDistrictWard);
			}else if(cityDistrictWard.getId().equals(ward)) {
				listJsonNew.add(cityDistrictWard);
			}
		}
		return listJsonNew;
	}
}
