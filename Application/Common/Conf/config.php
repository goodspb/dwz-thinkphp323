<?php

return array(

    //加载其他配置
    'LOAD_EXT_CONFIG' => 'db,dwz',

    /*
     * 0:普通模式 (采用传统癿URL参数模式 )
     * 1:PATHINFO模式(http://<serverName>/appName/module/action/id/1/)
     * 2:REWRITE模式(PATHINFO模式基础上隐藏index.php)
     * 3:兼容模式(普通模式和PATHINFO模式, 可以支持任何的运行环境, 如果你的环境不支持PATHINFO 请设置为3)
     */
    'URL_MODEL' => 2,

    /* 验证码 */
    'VERIFY_EXPIRE' => 300, //5分钟
    'VERIFY_LENGTH' => 4, //4位

);
