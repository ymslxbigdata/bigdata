package com.example.demo.service.dataMantance.globalEshopOverseasRepo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.example.demo.entity.GlobalEshopOverseasRepo;
import com.example.demo.repository.GlobalEshopOverseasRepoRepository;

@Service
public class GlobalEshopOverseasRepoService {
	
	@Autowired
	GlobalEshopOverseasRepoRepository globalEshopOverseasRepoRepository;
	
	public List<GlobalEshopOverseasRepo> getGlobalEshopOverseasRepo(GlobalEshopOverseasRepo para) {
		
		List<GlobalEshopOverseasRepo> dataList;
		
		String eshopId = para.getEshopId();
		
		if(!StringUtils.isEmpty(eshopId)) {
			dataList = globalEshopOverseasRepoRepository.findByEshopId(eshopId);
		}
		else {
			dataList = globalEshopOverseasRepoRepository.findAll();
		}
		
		return dataList;
	}
	
	public void saveData(GlobalEshopOverseasRepo para) {
		globalEshopOverseasRepoRepository.save(para);
	}
	
	public void deleteData(GlobalEshopOverseasRepo para) {
		globalEshopOverseasRepoRepository.delete(para);;
	}

	public void batchSaveData(List<GlobalEshopOverseasRepo> repoList) {
		globalEshopOverseasRepoRepository.saveAll(repoList);
		
	}
}
