package edu.group6.capston.services;

import java.util.List;

import edu.group6.capston.dtos.ComboDetailDTO;;

public interface ComboDetailService {
	List<ComboDetailDTO> findComboLocation(int location);
	List<ComboDetailDTO> findProductInComboLocation(int locationId);
}
