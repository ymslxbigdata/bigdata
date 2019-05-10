package com.example.demo.service.dataMantance.globalEshopUsersData;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.example.demo.entity.GlobalEshopUsersData;
import com.example.demo.repository.GlobalEshopUsersDataRepository;

@Service
public class GlobalEshopUsersDataService {
		
	@Autowired
	GlobalEshopUsersDataRepository globalEshopUsersDataRepository;
	
	public List<GlobalEshopUsersData> getGlobalEshopUsersData(GlobalEshopUsersData para) {
		
		List<GlobalEshopUsersData> dataList;
		
		String eshopNm = para.getEshopNm();
		
		if(!StringUtils.isEmpty(eshopNm)) {
			dataList = globalEshopUsersDataRepository.findByEshopNm(eshopNm);
		}
		else {
			dataList = globalEshopUsersDataRepository.findAll();
		}
		
		return dataList;
	}
}
