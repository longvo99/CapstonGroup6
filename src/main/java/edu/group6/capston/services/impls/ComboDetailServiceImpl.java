package edu.group6.capston.services.impls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.group6.capston.daos.ComboDetailDAO;
import edu.group6.capston.dtos.ComboDetailDTO;
import edu.group6.capston.services.ComboDetailService;

@Service
public class ComboDetailServiceImpl implements ComboDetailService {
	@Autowired
	private ComboDetailDAO comboDetailDAO;

	@Override
	public List<ComboDetailDTO> findComboLocation(int locationId) {
		return comboDetailDAO.findComboLocation(locationId);
	}

	@Override
	public List<ComboDetailDTO> findProductInComboLocation(int locationId) {
		// TODO Auto-generated method stub
		return comboDetailDAO.findProductInComboLocation(locationId);
	}
	
}
