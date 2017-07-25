package com.jun.meeting.Controller;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Service
public class TestService {

    @Autowired
    private UserDao userDao;

    public Integer getCurrentDataTime() {

        return userDao.getCurrentDateTime();
    }

}
