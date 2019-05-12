package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.beans.TradeDisplayModel;
import com.example.demo.entity.GlobalEshopTradeData;

@Repository
public interface GlobalEshopTradeDataRepository extends JpaRepository<GlobalEshopTradeData, String> {
	
	List<GlobalEshopTradeData> findByEshopId(String eshopId);
	List<GlobalEshopTradeData> findByTradeDate(String tradeMonth);
	List<GlobalEshopTradeData> findByEshopIdAndTradeDate(String eshopId,String tradeMonth);
	
	@Query(value="SELECT a.eshopNm AS eshopNm"
			+ "         ,b.userNum AS userNum"
			+ "         ,a.tradeVolumeDeveloped AS tradeVolumeDeveloped"
			+ "    FROM GlobalEshopTradeData a "
			+ "       , GlobalEshopUsersData b "
			+ "  WHERE a.eshopId =b.eshopId "
			+ "     AND a.eshopNm = b.eshopNm "
			+ "     AND a.tradeDate = ?1 ")
	List<Object[]> getDevelopedData(String tradeDate);
	
	@Query(value="SELECT a.eshop_nm"
			+ "         ,b.user_num"
			+ "         ,a.trade_volume_developing"
			+ "    FROM global_eshop_trade_data a "
			+ "       , global_eshop_users_data b "
			+ "  WHERE a.eshop_id =b.eshop_id "
			+ "     AND a.eshop_nm = b.eshop_nm "
			+ "     AND a.trade_date = ?1 ", nativeQuery= true)
	List<Object[]> getDevelopingData(String tradeDate);
}