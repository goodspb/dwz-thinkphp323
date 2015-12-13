<?php
namespace Admin\Controller;

class FormController extends CommonController
{
    //过滤查询字段
    public function _filter(&$map)
    {
        $map['title'] = array('like', "%" . $_POST['name'] . "%");
    }
}
