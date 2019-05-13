package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FurnitureTypesInfo;

@Repository
public interface FurnitureTypesInfoRepository extends JpaRepository<FurnitureTypesInfo, String> {
	
	List<FurnitureTypesInfo> findByTypeNmContaining(String typeNm);

}