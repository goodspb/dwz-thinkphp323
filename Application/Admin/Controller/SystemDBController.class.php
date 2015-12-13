<?php
namespace Admin\Controller;

class SystemDBController extends CommonController
{

    /**
     * 备份数据库
     */
    public function backupDB()
    {

        $host = C('DB_HOST') . (C('DB_PORT') ? ":" . C('DB_PORT') : '');
        $user = C('DB_USER');
        $password = C('DB_PWD');
        $dbname = C('DB_NAME');

        //连接mysql数据库
        if (!($link = mysqli_connect($host, $user, $password))) {
            $this->error('数据库连接失败');
        }
        //是否存在该数据库
        if (!mysqli_select_db($link, $dbname)) {
            $this->error('不存在数据库:' . $dbname);
        }
        mysqli_query($link, "set names 'utf8'");
        $mysql = "set charset utf8;\r\n";
        $q1 = mysqli_query("show tables");
        while ($t = mysqli_fetch_array($q1)) {
            $table = $t [0];
            $q2 = mysqli_query($link, "show create table `$table`");
            $sql = mysqli_fetch_array($q2);
            $mysql .= $sql ['Create Table'] . ";\r\n";
            $q3 = mysqli_query($link, "select * from `$table`");
            while ($data = mysqli_fetch_assoc($q3)) {
                $keys = array_keys($data);
                $keys = array_map('addslashes', $keys);
                $keys = join('`,`', $keys);
                $keys = "`" . $keys . "`";
                $vals = array_values($data);
                $vals = array_map('addslashes', $vals);
                $vals = join("','", $vals);
                $vals = "'" . $vals . "'";
                $mysql .= "insert into `$table`($keys) values($vals);\r\n";
            }
        }

        $dir = "../Public/mysql_bak";
        $filename = $dbname . date('Ymd') . ".sql";
        $path = $dir . "/" . $filename;

//        if (!is_dir($dir)) {
//            if(!mkdir($dir)){// 尝试创建目录
//                $this->error ( '无法目录'.$dir);
//            }
//        }
        $fp = fopen($path, 'w');
        fputs($fp, $mysql);
        fclose($fp);

        $this->success('数据备份成功<br><span style="color:red">' . $filename . '</span>');
    }
}
