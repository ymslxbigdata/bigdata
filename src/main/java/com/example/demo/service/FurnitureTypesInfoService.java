package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.FurnitureTypesInfo;
import com.example.demo.repository.FurnitureTypesInfoRepository;

@Service
public class FurnitureTypesInfoService {

	@Autowired
	FurnitureTypesInfoRepository furnitureTypesInfoRepository;
	
	public List<FurnitureTypesInfo> getTypeNmOptions() {
		return furnitureTypesInfoRepository.findAll();
	}
	
	public List<FurnitureTypesInfo> getFurnitureTypesInfoData(FurnitureTypesInfo furnitureTypesInfo) {
		return furnitureTypesInfoRepository.findByTypeNmContaining(furnitureTypesInfo.getTypeNm());
	}
	
	public void newOrModifyFurnitureType(FurnitureTypesInfo furnitureTypesInfo) {
		furnitureTypesInfoRepository.save(furnitureTypesInfo);
	}
	
	public Optional<FurnitureTypesInfo> getFurnitureTypesDetail(String typeId) {
		return furnitureTypesInfoRepository.findById(typeId);
	}
	
	public void deleteFurnitureTypes(String typeId) {
		furnitureTypesInfoRepository.deleteById(typeId);
	}
}
