package com.zero.feignclient.feign;

import com.zero.feignclient.bean.Licence;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @Author: zhyj
 * @Date: 2020/07/03 16:36
 */

@Component
@FeignClient(name = "token",url = "${url}")
public interface TokenClient {

    @PostMapping("/getAccessTokenV2")
    String getAccessToken(@RequestBody Licence licence);
}
