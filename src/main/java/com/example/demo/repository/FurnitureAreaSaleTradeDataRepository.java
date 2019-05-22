package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.FurnitureAreaSaleTradeData;

@Repository
public interface FurnitureAreaSaleTradeDataRepository extends JpaRepository<FurnitureAreaSaleTradeData, String> {
	
	@Query(value="SELECT trade_date"
			+ "         ,trade_volume_africa "
			+"          ,trade_volume_asia"
			+"          ,trade_volume_europe"
			+"          ,trade_volume_n_america"
			+"          ,trade_volume_oceania"
			+"          ,trade_volume_s_america"
			+"          ,trade_volume_s_china"
			+ "    FROM furniture_area_sale_trade_data "
			+ "   WHERE trade_date = ?1 ", nativeQuery = true)
	List<FurnitureAreaSaleTradeData> findByTradeDate(String tradeDate);
}