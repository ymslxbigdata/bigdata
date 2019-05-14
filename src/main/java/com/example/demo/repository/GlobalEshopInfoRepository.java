package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.GlobalEshopInfo;

@Repository
public interface GlobalEshopInfoRepository extends JpaRepository<GlobalEshopInfo, String> {
	
	@Query(value="SELECT countryNm"
			+ " FROM GlobalEshopInfo "
			+ " GROUP BY countryNm"
			+ " ORDER BY countryNm")
	List<String> findEshopOptions();
	
	List<GlobalEshopInfo> findByEshopIdContainingAndEshopNmContainingAndCountryNmStartingWith(String eshopId, String eshopNm, String countryNm);

}