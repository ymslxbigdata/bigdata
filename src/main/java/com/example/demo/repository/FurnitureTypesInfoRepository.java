package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FurnitureTypesInfo;

@Repository
public interface FurnitureTypesInfoRepository extends JpaRepository<FurnitureTypesInfo, String> {
	
	public List<FurnitureTypesInfo> findByTypeNmContaining(String typeNm);
}