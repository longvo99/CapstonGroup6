package edu.group6.capston.controller.admins;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.group6.capston.services.LocationTypeService;
import edu.group6.capston.utils.readFileJson;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	
	@Autowired
	MessageSource messageSource;
	
	@Autowired
	private LocationTypeService locationTypeService;
	
	@RequestMapping(value ="/index")
	public String Index(Model model, HttpServletRequest request) {
		readFileJson.readFileJsonCity();
		return "admin.index";
	}

}
