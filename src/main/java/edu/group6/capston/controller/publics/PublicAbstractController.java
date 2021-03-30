package edu.group6.capston.controller.publics;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import edu.group6.capston.models.LocationCategory;
import edu.group6.capston.services.LocationCategoriesService;
import edu.group6.capston.utils.UploadFile;

public abstract class PublicAbstractController  {
	
	@Autowired
	private LocationCategoriesService locationCategoriesService;
	
	@ModelAttribute
	public void addCommonObjects(Model model) {
		List<LocationCategory> locationCategoriesList = locationCategoriesService.findAll();
		List<LocationCategory> locationCategoriesList1 = new ArrayList<LocationCategory>();
		List<LocationCategory> locationCategoriesList2 = new ArrayList<LocationCategory>();
		for (LocationCategory locationCategories : locationCategoriesList) {
			if(locationCategories.getParentId() == locationCategories.getCategoryId()){
				locationCategoriesList1.add(locationCategories);
			} else {
				locationCategoriesList2.add(locationCategories);
			}
		}
		model.addAttribute("locationCategoriesList1", locationCategoriesList1);
		model.addAttribute("locationCategoriesList2", locationCategoriesList2);
	}
}
