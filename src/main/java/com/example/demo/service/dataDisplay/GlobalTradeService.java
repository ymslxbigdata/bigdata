package com.example.demo.service.dataDisplay;
/*
 * @author Lin Lijian
 * @version 1.0.0
 * @since 1.0.0
 *
 * <MODIFICATION HISTORY>
 *  (Rev.)    (Date)        (Name)        (Comment)
 *  1.0.0     2019-05-12    Lin Lijian    New making
 */

import com.example.demo.repository.GlobalEshopTradeDataRepository;
import com.example.demo.repository.GlobalEshopUsersDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GlobalTradeService {

    @Autowired
    GlobalEshopTradeDataRepository globalEshopTradeDataRepository;

    @Autowired
    GlobalEshopUsersDataRepository globalEshopUsersDataRepository;


}
