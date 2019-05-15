package com.example.demo.service.dataMantance.globalEshopUsersData;

import java.util.List;
import java.util.Optional;

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
	
	public void newOrModifyEshopUserData(GlobalEshopUsersData para) {
		globalEshopUsersDataRepository.save(para);
	}
	
	public Optional<GlobalEshopUsersData> getGlobalEshopUserDataDetail(GlobalEshopUsersData para) {
		return globalEshopUsersDataRepository.findById(para.getEshopId());
	}
	
	public void deleteEshopUsersData(String eshopId) {
		globalEshopUsersDataRepository.deleteById(eshopId);
	}

	public void batchSaveData(List<GlobalEshopUsersData> usersDataList) {
		globalEshopUsersDataRepository.saveAll(usersDataList);
	}
}
