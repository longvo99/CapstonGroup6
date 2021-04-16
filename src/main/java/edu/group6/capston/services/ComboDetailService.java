package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.ComboDetailDTO;
import edu.group6.capston.models.ComboDetail;;

public interface ComboDetailService {
	List<ComboDetailDTO> findComboLocation(int location);
	List<ComboDetailDTO> findProductInComboLocation(int locationId);
	boolean delete(ComboDetailService comboDetailService);
	void delete(Integer productComboId);
	void save(ComboDetail comboDetail);
}
