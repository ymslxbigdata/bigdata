package com.example.demo.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.example.demo.entity.GlobalEshopTradeData;

@Repository
public interface GlobalEshopTradeDataRepository extends JpaRepository<GlobalEshopTradeData, String> {

	List<GlobalEshopTradeData> findByEshopId(String eshopId);
	List<GlobalEshopTradeData> findByTradeDate(String tradeMonth);
	List<GlobalEshopTradeData> findByEshopIdAndTradeDate(String eshopId,String tradeMonth);



	@Query(value = " SELECT A.eshop_id                     "
	             + "       ,A.eshop_nm                     "
	             + "       ,A.trade_date                   "
	             + "       ,A.trade_volume                 "
	             + " 	   ,C.user_num                     "
	             + "   FROM global_eshop_trade_data      A "
	             + "  INNER JOIN global_eshop_info       B "
	             + "     ON A.eshop_id = B.eshop_id        "
	             + "   LEFT JOIN global_eshop_users_data C "
	             + "     ON A.eshop_id = C.eshop_id        "
	             + "  WHERE B.is_main_eshop = TRUE         "
			     + "    AND A.trade_date = ?1              " , nativeQuery = true)
	List<Object[]> getMainStreamShopData(String tradeDate);
	/*
海外主流仓地址
	SELECT A.eshop_id
      ,A.eshop_nm
      ,C.repo_id
      ,C.repo_location_x
      ,C.repo_location_y
	FROM global_eshop_trade_data         A
	INNER JOIN global_eshop_info          B
	ON A.eshop_id = B.eshop_id
	LEFT JOIN global_eshop_overseas_repo C
	ON A.eshop_id = C.eshop_id
	WHERE B.is_main_eshop = TRUE*/
	@Query(value = "SELECT A.eshop_id                "
                 + "      ,A.eshop_nm                "
                 + "      ,B.location_x              "
                 + "      ,B.location_y              "
                 + "  FROM global_eshop_trade_data A "
                 + " INNER JOIN global_eshop_info  B "
                 + "    ON A.eshop_id = B.eshop_id   "
                 + " WHERE B.is_main_eshop = TRUE    " , nativeQuery = true)
	List<Object[]> getRepoLocation();


	@Query(value=" SELECT a.eshopNm AS eshopNm                           "
			   + "       ,b.userNum AS userNum                           "
			   + "       ,a.tradeVolumeDeveloped AS tradeVolumeDeveloped "
			   + "  FROM GlobalEshopTradeData a                          "
			   + "  LEFT OUTER JOIN GlobalEshopUsersData b               "
			   + "    ON a.eshopId =b.eshopId                            "
			   + "   AND a.eshopNm = b.eshopNm                           "
			   + " WHERE a.tradeDate = ?1                                ")
	List<Object[]> getDevelopedData(String tradeDate);

	@Query(value="  SELECT a.eshop_nm                             "
			   + "          ,b.user_num                           "
			   + "          ,a.trade_volume_developing            "
			   + "     FROM global_eshop_trade_data a             "
			   + "     LEFT OUTER JOIN global_eshop_users_data b  "
			   + "       ON a.eshop_id =b.eshop_id                "
			   + "      AND a.eshop_nm = b.eshop_nm               "
			   + "    WHERE a.trade_date = ?1          ", nativeQuery= true)
	List<Object[]> getDevelopingData(String tradeDate);

	@Query(value="SELECT SUM(trade_volume_africa)    AS \"A\"  "
			    +"      ,SUM(trade_volume_asia)      AS \"B\"  "
			    +"      ,SUM(trade_volume_europe)    AS \"C\"  "
			    +"      ,SUM(trade_volume_n_america) AS \"D\"  "
			    +"      ,SUM(trade_volume_oceania)   AS \"E\"  "
			    +"      ,SUM(trade_volume_s_america) AS \"F\"  "
			    +"      ,SUM(trade_volume_s_china)   AS \"G\"  "
			    +"  FROM global_eshop_trade_data       "
			    +" WHERE trade_date = ?1               ", nativeQuery = true)
	List<Object[]> getXBorderTotalSales(String tradeDate);

	@Query(value=" SELECT A.eshop_nm,                    " +
			     "        B.trade_volume                 " +
			     "   FROM global_eshop_info            A " +
			     "   LEFT JOIN global_eshop_trade_data B " +
			     "     ON A.eshop_id = B.eshop_id        " +
			     "  WHERE A.is_main_eshop = 'true'       " +
			     "    AND B.trade_date = ?1              " , nativeQuery = true)
	List<Object[]> getMainStreamTotalSales(String tradeDate);

	@Query(value=" SELECT A.eshop_nm,                    " +
		         "        B.user_num                     " +
		         "   FROM global_eshop_info            A " +
		         "   LEFT JOIN global_eshop_users_data B " +
		         "     ON A.eshop_id = B.eshop_id        " +
		         "  WHERE A.is_main_eshop = 'true'       " , nativeQuery = true)
	List<Object[]> getMainStreamUserCnt();
}