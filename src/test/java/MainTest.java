import org.svnadmin.common.util.HttpUtils;

/**
 * @描述: .
 * @作者: Zoro.
 * @创建时间: 2016-05-09 14:18.
 * @版本: 1.0.0.
 */
public class MainTest {
    public static void main(String args[]) {
        System.out.println(HttpUtils.urlEncode("SVN资源管理平台","utf-8"));
        System.out.println(HttpUtils.urlDecode("SVN%E8%B5%84%E6%BA%90%E7%AE%A1%E7%90%86%E5%B9%B3%E5%8F%B0","utf-8"));
    }
}
