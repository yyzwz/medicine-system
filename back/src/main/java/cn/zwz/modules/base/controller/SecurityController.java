package cn.zwz.modules.base.controller;

import cn.zwz.common.utils.ResultUtil;
import cn.zwz.common.vo.Result;
import io.swagger.annotations.Api;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author 郑为中
 */
@RestController
@Api(tags = "Security接口")
@RequestMapping("/zwz/common")
@Transactional
public class SecurityController {

    @RequestMapping(value = "/needLogin", method = RequestMethod.GET)
    public Result<Object> needLogin(){
        return ResultUtil.error(401, "您还未登录");
    }
}
