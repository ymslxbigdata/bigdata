package com.example.demo.service.dataMantance;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.GlobalEshopInfo;
import com.example.demo.repository.GlobalEshopInfoRepository;

@Service
public class GlobalEshopInfoService {

	@Autowired
	GlobalEshopInfoRepository globalEshopInfoRepository;
	
	public List<String> getEshopOptions() {
		return globalEshopInfoRepository.findEshopOptions();
	}
	
	public List<GlobalEshopInfo> getGlobalEshopInfo(GlobalEshopInfo globalEshopInfo) {
		
		return globalEshopInfoRepository
				.findByEshopIdContainingAndEshopNmContainingAndCountryNmStartingWith(globalEshopInfo.getEshopId()
																	   , globalEshopInfo.getEshopNm()
																	   , globalEshopInfo.getCountryNm());
	}
	
	public Optional<GlobalEshopInfo> getGlobalEshopInfoDetail(String eshopId) {
		return globalEshopInfoRepository.findById(eshopId);
	}
	
	public void newOrModifyEshopInfo(GlobalEshopInfo globalEshopInfo) {
		globalEshopInfoRepository.save(globalEshopInfo);
	}
	
	public void deleteEshopInfo(String eshopId) {
		globalEshopInfoRepository.deleteById(eshopId);;
	}
}

