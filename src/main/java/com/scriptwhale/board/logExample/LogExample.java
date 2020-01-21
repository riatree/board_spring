package com.scriptwhale.board.logExample;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LogExample {
    private static final Logger LOGGER = LoggerFactory.getLogger(LogExample.class);

    public void test() {
        LOGGER.debug("ID : {}", "LOGGER");

    }
}
