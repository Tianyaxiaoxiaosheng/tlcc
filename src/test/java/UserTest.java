import com.domain.Person;
import com.util.MybatisUtil;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;


/**
 * Created by jony on 2/1/18.
 */
public class UserTest {

    SqlSession sqlSession ;

    @Test
    public void queryById(){

        sqlSession = MybatisUtil.getSqlSession();
        int id = 1;
        try{
            Person person = sqlSession.selectOne("queryById",id);

            sqlSession.commit();
            System.out.println(person.toString());
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            MybatisUtil.closeSession(sqlSession);
        }

    }
}
